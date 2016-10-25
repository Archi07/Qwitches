//
//  Facilities.m
//  Ringy
//
//  Created by Ravi Patel on 23/03/12.
//  Copyright (c) 2012 milind.shroff@spec-india.com. All rights reserved.
//

#import "Facilities.h"

#define APPLICATION_DB @"MyDB.sqlite"

@implementation Facilities
-(NSString*)getAllFacility:(NSInteger)facilityId
{
	NSString *facility = @"";
	if (sqlite3_open([[self getDBPath] UTF8String], &database) == SQLITE_OK)
    {
		NSString *sql =[NSString stringWithFormat:@"SELECT contactname FROM tblcontact where contactid= %ld",facilityId];
		sqlite3_stmt *selectstmt;
		if(sqlite3_prepare_v2(database, [sql UTF8String], -1, &selectstmt, NULL) == SQLITE_OK) 
        {
			while(sqlite3_step(selectstmt) == SQLITE_ROW) 
            {
				facility = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 0)];
			}
		}
		else 
        {
			NSLog( @"Failed to select data from the database.");
		}
		sqlite3_clear_bindings(selectstmt);
		sqlite3_finalize(selectstmt);	
		//sqlite3_reset(selectstmt);
	}
	[self finalizeStatements];
	return facility;
	
}

- (NSString *) getDBPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    NSLog(@"Path: %@",documentsDir);
    return [documentsDir stringByAppendingPathComponent:APPLICATION_DB];
}

-(BOOL) executeSQL:(NSString *)sqlTmp 
{
	@try 
    {
        if(sqlite3_open([[self getDBPath] UTF8String], &database) == SQLITE_OK)
        {     
            //NSLog(@"%@",sqlTmp);
            const char *sqlStmt = [sqlTmp cStringUsingEncoding:NSUTF8StringEncoding];
            sqlite3_stmt *cmp_sqlStmt1;
            int returnValue = sqlite3_prepare_v2(database, sqlStmt, -1, &cmp_sqlStmt1, NULL);
            
            returnValue == SQLITE_OK ?  NSLog(@"\n Inserted \n") :NSLog(@"\n Not Inserted \n");
            
            sqlite3_step(cmp_sqlStmt1);
            sqlite3_finalize(cmp_sqlStmt1);
            //NSLog(@"execute successfully");
            
            if (returnValue == SQLITE_OK)
            {
                return TRUE;
                NSLog(@"execute successfully if");
            }
        }
        return FALSE;
    }
    @catch (NSException *exception) {
        NSLog(@"%@",[exception reason]);
        return NO;
    }
}

-(NSMutableArray*) selectData:(NSString *)sql
{
    @try 
    {
        sqlite3_stmt *stmt = nil;
        if (sqlite3_open([[self getDBPath] UTF8String], &database) == SQLITE_OK)
        {
            if(sqlite3_prepare_v2(database, [sql UTF8String], -1, &stmt, NULL) != SQLITE_OK) 
            {
                [NSException raise:@"DatabaseException" format:@"Error while creating statement. '%s'", sqlite3_errmsg(database)];
            }
            NSMutableArray *obj = [[NSMutableArray alloc]init];
            int numResultColumns = 0;
            while (sqlite3_step(stmt) == SQLITE_ROW) {
                numResultColumns = sqlite3_column_count(stmt);
                @autoreleasepool {
                    NSMutableDictionary *tmpObj = [[NSMutableDictionary alloc]init];
                    for(int i = 0; i < numResultColumns; i++)
                    {
                        if(sqlite3_column_type(stmt, i) == SQLITE_INTEGER)
                        {
                            const char *name = sqlite3_column_name(stmt, i);
                            NSString *columnName = [[NSString alloc]initWithCString:name encoding:NSUTF8StringEncoding];
                            [tmpObj setObject:[NSString stringWithFormat:@"%i",sqlite3_column_int(stmt, i)] forKey:columnName];
                            // NSLog(@"open database if");
                        } 
                        else if (sqlite3_column_type(stmt, i) == SQLITE_FLOAT) 
                        {
                            const char *name = sqlite3_column_name(stmt, i);
                            NSString *columnName = [[NSString alloc]initWithCString:name encoding:NSUTF8StringEncoding];
                            [tmpObj setObject:[NSString stringWithFormat:@"%f",sqlite3_column_double(stmt, i)] forKey:columnName];
                            //// NSLog(@"open database else");
                        } 
                        else if (sqlite3_column_type(stmt, i) == SQLITE_TEXT) 
                        {
                            const char *name = sqlite3_column_name(stmt, i);
                            NSString *tmpStr = [NSString stringWithUTF8String:(char *)sqlite3_column_text(stmt, i)];
                            if ( tmpStr == nil) 
                            {
                                tmpStr = @"";
                            }
                            NSString *columnName = [[NSString alloc]initWithCString:name encoding:NSUTF8StringEncoding];
                            [tmpObj setObject:tmpStr forKey:columnName];
                        }
                        else if (sqlite3_column_type(stmt, i) == SQLITE_BLOB) 
                        {
                            
                        }     
                    }
                    [obj addObject:tmpObj];
                    //NSLog(@"%@",tmpObj);
                }
            }
            return obj;
        } else {
            return nil;
        }
        
    }
    @catch (NSException *exception) {
        NSLog(@"%@",[exception reason]);
        return nil;
    }
}

- (void)finalizeStatements
{
	if(database) 
		sqlite3_close(database);
}

- (void)dealloc 
{
	database = nil;
}
@end
