//
//  RegistrationViewController.m
//  Registration
//
//  Created by Ravi Patel on 24/07/16.
//  Copyright © 2016 Mobio Solutions. All rights reserved.
//

#import "RegistrationViewController.h"
#import "Facilities.h"

@interface RegistrationViewController ()
{
    Facilities *dbFacility;
}
@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dbFacility = [[Facilities alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)btnBackClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(IBAction)btnRegistrationClicked:(id)sender
{
    if([self isNull:txtPassword.text] || [self isNull:txtEmail.text] || [self isNull:txtLastName.text] || [self isNull:txtFirstName.text] || [self isNull:txtConfirmPassword.text])
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Please enter all details" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        if([txtPassword.text isEqualToString:txtConfirmPassword.text])
        {
            BOOL res = [dbFacility executeSQL:[NSString stringWithFormat:@"insert into UserRegistration(firstname,lastname,email,password) values('%@','%@','%@','%@')",txtFirstName.text,txtLastName.text,txtEmail.text,txtPassword.text]];
            if(res)
            {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Congratulations!" message:@"You have registered successfully." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alert show];
                
                [self.navigationController popViewControllerAnimated:YES];
            }
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Password and confirm password does not match." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
        }
    }
}

-(BOOL)isNull:(NSString *)str
{
    NSLog(@"Str : %@",str);
    if([str isEqualToString:@""] || [[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""])
    {
        return YES;
    }
    return NO;
}

@end
