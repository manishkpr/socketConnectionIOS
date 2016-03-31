//
//  LoginViewController.h
//  RealTimeReq
//
//  Created by admin on 3/30/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "BaseViewController.h"

@interface LoginViewController : BaseViewController
- (IBAction)bt_loginClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txt_user;
@property (weak, nonatomic) IBOutlet UITextField *txt_password;

@end
