//
//  CreateUserViewController.h
//  RealTimeReq
//
//  Created by admin on 3/30/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "BaseViewController.h"

@interface CreateUserViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *txt_userName;
@property (weak, nonatomic) IBOutlet UITextField *txt_email;
@property (weak, nonatomic) IBOutlet UITextField *txt_Password;
- (IBAction)bt_createClicked:(id)sender;

@end
