//
//  ViewController.m
//  Registration
//
//  Created by Ravi Patel on 24/07/16.
//  Copyright © 2016 Mobio Solutions. All rights reserved.
//

#import "LoginViewController.h"
#import "Facilities.h"
#import "RegistrationViewController.h"


@interface LoginViewController ()
{
    Facilities *dbFacility;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dbFacility = [[Facilities alloc]init];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnLoginClicked:(id)sender
{
    if([self isNull:txtEmail.text] || [self isNull:txtPassword.text])
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Please enter email and password. " delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
       // NSArray *arr = [dbFacility selectData:[NSString stringWithFormat:@"select * from UserRegistration where email='%@' and password='%@'",txtEmail.text,txtPassword.text]];
       // if([arr count]>0)
       // {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Login successful!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
        
        UIViewController * loginPage = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"tabBar"] ;
        [self.navigationController pushViewController:loginPage animated:YES] ;
        
        
       // }
    }
}

-(BOOL)isNull:(NSString *)str
{
    if([str isEqualToString:@""] || [[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""])
    {
        return YES;
    }
    return NO;
}

-(IBAction)btnRegistrationClicked:(id)sender
{
    RegistrationViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"RegistrationViewController"];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
