//
//  ListUserViewCell.h
//  RealTimeReq
//
//  Created by admin on 3/31/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListUserViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lb_userName;
@property (weak, nonatomic) IBOutlet UILabel *userEmail;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
//@property (strong, nonatomic)  NSString *imageURL;
- (void) loadImageFromURL:(NSString *)imageURL;
@end
