//
//  Facilities.h
//  Ringy
//
//  Created by Ravi Patel on 23/03/12.
//  Copyright (c) 2012 milind.shroff@spec-india.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

//#import "DataStructure.h"
@interface Facilities : NSObject
{
    sqlite3 *database;
}
-(NSString*)getAllFacility:(NSInteger)facilityId;
-(BOOL) executeSQL:(NSString *)sqlTmp;
-(NSMutableArray*) selectData:(NSString *)sql;
- (void)finalizeStatements;
@end
