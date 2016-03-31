//
//  ListUserViewController.h
//  RealTimeReq
//
//  Created by admin on 3/30/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "BaseViewController.h"

@interface ListUserViewController :  BaseViewController<UITabBarDelegate,UITableViewDataSource>
@property (strong, nonatomic) NSArray *arrList;   // The list of help
@property (strong, nonatomic) UITableView *tableView;  // The table view all help

@end
