//
//  ListUserViewCell.m
//  RealTimeReq
//
//  Created by admin on 3/31/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "ListUserViewCell.h"
#import "FTWCache.h"
#import "NSString+MD5.h"

@implementation ListUserViewCell
//@synthesize  imageURL;

- (void) loadImageFromURL:(NSString *)imageURL {
    NSURL *imageUrl = [NSURL URLWithString:imageURL];
    NSString *key = [imageURL MD5Hash];
    NSData *data = [FTWCache objectForKey:key];
    if (data) {
        UIImage *image = [UIImage imageWithData:data];
        self.userImage.image = image;
    } else {
        self.userImage.image = [UIImage imageNamed:@"img_def"];
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
        dispatch_async(queue, ^{
            NSData *data = [NSData dataWithContentsOfURL:imageUrl];
            [FTWCache setObject:data forKey:key];
            UIImage *image = [UIImage imageWithData:data];
            dispatch_sync(dispatch_get_main_queue(), ^{
                self.userImage.image = image;
            });
        });
    }
}
@end
