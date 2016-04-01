//
//  LeftViewController.m
//  RealTimeReq
//
//  Created by admin on 3/30/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "LeftViewController.h"
#import "LoginViewController.h"

@implementation LeftViewController


- (IBAction)bt_mainClicked:(id)sender {
    
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{
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
        self.view.window.rootViewController = container;
        
    }];
}

- (IBAction)bt_aboutClicked:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        MFSideMenuContainerViewController *container = self.menuContainerViewController;
        NSString *firstViewControllerName = @"aboutView";
        UINavigationController *navigationController = [storyboard instantiateViewControllerWithIdentifier:firstViewControllerName];
        [container setCenterViewController:navigationController];

    }];
   
}

- (IBAction)bt_LogoutClicked:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{
        
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:Mesage_Titile  message:MESSAGE_DISCONNECT preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
                                                                 LoginViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginView"];
                                                                  UINavigationController *nav = [[UINavigationController alloc]
                                                                                                 initWithRootViewController:vc];
                                                                  LeftViewController *leftview = [self.storyboard instantiateViewControllerWithIdentifier:@"LeftView"];
                                                                  MFSideMenuContainerViewController *container = [MFSideMenuContainerViewController
                                                                                                                  containerWithCenterViewController:nav
                                                                                                                  leftMenuViewController:leftview
                                                                                                                  rightMenuViewController:nil];
                                                                  self.view.window.rootViewController = container;
                                                                  
                                                              }];
        UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * action) {
                                                           [alert dismissViewControllerAnimated:YES completion:nil];
                                                       }];
        
        [alert addAction:defaultAction];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
        
    }];
}
@end
