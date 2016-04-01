//
//  LoginViewController.m
//  RealTimeReq
//
//  Created by admin on 3/30/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "LoginViewController.h"
#import "LeftViewController.h"
#import "UserRecord.h"

@implementation LoginViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title =@"Login";
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationItem setHidesBackButton:YES];
    self.navigationItem.leftBarButtonItem = nil;
    NSString * user = [ShareData instance].crUserEmail ;
    if (user || [AppUtility getUserDefaults:@"u_a"]) {
        self.txt_user.text?user:[AppUtility getUserDefaults:@"u_a"];
        return;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)changeToMainView{
    UITabBarController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MainView"];
    
    UITabBar *tabBar = vc.tabBar;
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    tabBarItem1.title = @"Users";
    tabBarItem2.title = @"Settings";
    tabBarItem1.image = [[UIImage imageNamed:@"ItemListIconOff30"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem1.selectedImage = [[UIImage imageNamed:@"ItemListIcon30"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem2.image = [[UIImage imageNamed:@"SettingIconOff30"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem2.selectedImage = [[UIImage imageNamed:@"SettingIcon30"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBar.tintColor = [UIColor blueColor];
   
    LeftViewController *leftSideMenuController = [self.storyboard instantiateViewControllerWithIdentifier:@"LeftView"];
    MFSideMenuContainerViewController *container = [MFSideMenuContainerViewController
                                                    containerWithCenterViewController:vc
                                                    leftMenuViewController:leftSideMenuController
                                                    rightMenuViewController:nil];
    [[self navigationController] pushViewController:container animated:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}

- (IBAction)bt_loginClicked:(id)sender {
    self.txt_password.text =@"password";
    self.txt_user.text =@"password@gmail.com";
    [self showMBProcess];
    if (![AppUtility isNetworkAvailable]) {
        [self hideMBProcess];
        [self showAlertBox:Mesage_Titile message:Mesage_Network];
        return;
    }
    NSString *userName = self.txt_user.text;
    NSString *userPassword = self.txt_password.text;
    if ([userName isEqualToString:@""]|| [userPassword isEqualToString:@""]) {
        [self showAlertBox:Mesage_Titile message:Mesage_Login_Empty];
        [self hideMBProcess];
        return;
    }
    [self doLogin:userName password:userPassword];
}
#pragma mark - Service
- (void)doLogin:(NSString *)username password:(NSString*)password {
    [self.txt_password endEditing:YES];
    [self.txt_user endEditing:YES];
    ShareData *shared = [ShareData instance];
    [shared.userProxy doLogin:username password:password completeHandler:^(id result, NSString *errorCode, NSString *message){
        [self hideMBProcess];
        if([errorCode isEqualToString:@"(null)"]){
            UserRecord *user = result;
            user.userName = username;
            user.userPass = password;
            shared.tocket = user.userToken;
            
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            [dict setValue:username forKeyPath:@"u_a"];
            [AppUtility saveUserDefaults:dict];
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            [self changeToMainView];
        }  else {
            [self showAlertBox:Mesage_Titile message:Mesage_Login_Error];
            
        }
        
        
    } errorHandler:^(NSError *error) {
        [self hideMBProcess];
        [self showAlertBox:Mesage_Titile message:[NSString stringWithFormat:@"%@",error]];
    }];
    [self.txt_user endEditing:NO];
    [self.txt_password endEditing:NO];
}

@end
