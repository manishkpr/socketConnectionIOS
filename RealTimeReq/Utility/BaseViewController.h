//
//  BaseViewController.h
//  RealTimeReq
//
//  Created by admin on 3/31/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic,retain) UITableView *tableView;
@property (nonatomic,retain) NSArray *objectNameList;
@property (nonatomic,retain) NSString *regcode;


- (BOOL) returnSpecialType:(NSString *)type;

- (void)showAlertBox:(NSString *)title
             message:(NSString *)message;
-(void)ShowAlertBoxEmpty;
- (void) showMBProcess;
- (void) hideMBProcess;

@end
