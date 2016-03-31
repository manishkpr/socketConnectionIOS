//
//  CreateUserViewController.m
//  RealTimeReq
//
//  Created by admin on 3/30/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "CreateUserViewController.h"

@implementation CreateUserViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title =@"Sign up";
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationItem setHidesBackButton:YES];
    self.navigationItem.leftBarButtonItem = nil;

}
- (IBAction)bt_createClicked:(id)sender {
//    self.txt_userName.text =@"password";
//    self.txt_user.text =@"password@gmail.com";
    [self showMBProcess];
    if (![AppUtility isNetworkAvailable]) {
        [self hideMBProcess];
        [self showAlertBox:Mesage_Titile message:Mesage_Network];
        return;
    }
    NSString *email = self.txt_email.text;
    NSString *userPassword = self.txt_Password.text;
    NSString *userName = self.txt_userName.text;
    if ([email isEqualToString:@""]|| [userPassword isEqualToString:@""]|| [userName isEqualToString:@""]) {
        [self showAlertBox:Mesage_Titile message:Mesage_Create_Empty];
        [self hideMBProcess];
        return;
    }
    [self doCreate:userName password:userPassword Email:email];
}
#pragma mark - Service
- (void)doCreate:(NSString *)username password:(NSString*)password  Email:(NSString*)email{
    [self.txt_Password endEditing:YES];
    [self.txt_userName endEditing:YES];
    [self.txt_email endEditing:YES];
    ShareData *shared = [ShareData instance];
    [shared.userProxy doCreat:username Email:password password:password completeHandler:^(id result, NSString *errorCode, NSString *message){
        [self hideMBProcess];
        if([errorCode isEqualToString:@"(null)"]){
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            shared.crUserEmail = self.txt_email.text;
            [self changeToLoginView];
        }  else {
            [self showAlertBox:Mesage_Titile message:Mesage_Login_Error];
            
        }
        
        
    } errorHandler:^(NSError *error) {
        [self hideMBProcess];
        [self showAlertBox:Mesage_Titile message:[NSString stringWithFormat:@"%@",error]];
    }];
    [self.txt_Password endEditing:NO];
    [self.txt_userName endEditing:NO];
    [self.txt_email endEditing:NO];

}
-(void)changeToLoginView {
    [self.navigationController popViewControllerAnimated:YES];

}
@end
