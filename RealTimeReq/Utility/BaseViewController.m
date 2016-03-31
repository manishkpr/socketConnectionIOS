//
//  BaseViewController.m
//  RealTimeReq
//
//  Created by admin on 3/31/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "BaseViewController.h"
#import <netinet/in.h>
#include <ifaddrs.h>
#include <arpa/inet.h>
#import <sys/socket.h>
#import "ShareData.h"

@interface BaseViewController ()
{
    MBProgressHUD *HUD;
}
@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initNavibarItem];
    [self setupMenuBarButtonItems];
    [self.menuContainerViewController setRightMenuWidth:0];
    
}
-(void)initNavibarItem{
    [self setupMenuBarButtonItems];
//    self.menuContainerViewController.panMode=1;
    
    UIImage *backgroundImage = [UIImage imageNamed:@"br_navibar"];
    [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    
}
#pragma mark - UIBarButtonItems

- (void)setupMenuBarButtonItems {
    if(self.menuContainerViewController.menuState == MFSideMenuStateClosed){
        self.navigationItem.leftBarButtonItem = [self leftMenuBarButtonItem];
    }
    
}

- (UIBarButtonItem *)leftMenuBarButtonItem {
    return [[UIBarButtonItem alloc]
            initWithImage:[[UIImage imageNamed:@"ic_menu"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain
            target:self
            action:@selector(leftSideMenuButtonPressed:)];
}


#pragma mark - UIBarButtonItem Callbacks

- (void)backButtonPressed:(id)sender {
        [self.navigationController popViewControllerAnimated:YES];
}
- (void)showBasicAlertView
{
    NSString *alertTitle = @"Thông báo";
    NSString *alertMessage = @"Bạn có muốn trở lại màn hình chính không";
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:alertTitle
                                                                             message:alertMessage
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction *action)
                                   {
                                       return;
                                   }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction *action)
                               {
                                   [self.navigationController popViewControllerAnimated:YES];
                               }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)leftSideMenuButtonPressed:(id)sender {
    
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{
        //[self setupMenuBarButtonItems];
    }];
}

- (UIBarButtonItem *)backBarButtonItem{
    UIImage *image = [AppUtility imageWithImageHeight:[[UIImage imageNamed:@"ic_pre"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] height:30];
    return [[UIBarButtonItem alloc]
            initWithImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain
            target:self
            action:@selector(backButtonPressed:)];
}



#pragma show alert
- (void)showAlertBox:(NSString *)title
             message:(NSString *)message {
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK",nil];
    [alertView show];
    
}

-(void)ShowAlertBoxEmpty{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Thông Báo" message:Mesage_DataEmpty delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    [alert show];
    [self performSelector:@selector(dismiss:) withObject:alert afterDelay:1.0];
}

-(void)dismiss:(UIAlertView*)alert
{
    [alert dismissWithClickedButtonIndex:0 animated:YES];
}


#pragma mark process bar
- (void) showMBProcess
{
    
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self.view addSubview:HUD];
    
    HUD.delegate = (id<MBProgressHUDDelegate>)self;
   // HUD.labelText = @"Loading";
    
    [HUD show:YES];
}

- (void) hideMBProcess
{
    [HUD hide:YES];
}


#pragma retun special type
- (BOOL) returnSpecialType:(NSString *)type
{
    if([type rangeOfString:@"?"].location != NSNotFound)
        return 1;
    else if([type rangeOfString:@"˜"].location != NSNotFound)
        return 1;
    else if([type rangeOfString:@"`"].location != NSNotFound)
        return 1;
    else if([type rangeOfString:@"!"].location != NSNotFound)
        return 1;
    else if([type rangeOfString:@"#"].location != NSNotFound)
        return 1;
    else if([type rangeOfString:@"ˆ"].location != NSNotFound)
        return 1;
    else if([type rangeOfString:@"*"].location != NSNotFound)
        return 1;
    else if([type rangeOfString:@"("].location != NSNotFound)
        return 1;
    else if([type rangeOfString:@")"].location != NSNotFound)
        return 1;
    else if([type rangeOfString:@"+"].location != NSNotFound)
        return 1;
    else if([type rangeOfString:@"{"].location != NSNotFound)
        return 1;
    else if([type rangeOfString:@"}"].location != NSNotFound)
        return 1;
    else if([type rangeOfString:@"["].location != NSNotFound)
        return 1;
    else if([type rangeOfString:@"]"].location != NSNotFound)
        return 1;
    else if([type rangeOfString:@"|"].location != NSNotFound)
        return 1;
    else if([type rangeOfString:@"&"].location != NSNotFound)
        return 1;
    else if([type rangeOfString:@"$"].location != NSNotFound)
        return 1;
    else if([type rangeOfString:@"@"].location != NSNotFound)
        return 1;
    else if([type rangeOfString:@":"].location != NSNotFound)
        return 1;
    else if([type isEqualToString:@""])
        return 1;
    return 0;
    
}


@end
