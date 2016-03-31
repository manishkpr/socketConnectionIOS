//
//  ShareData.h
//  RealTimeReq
//
//  Created by admin on 3/31/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppProxy.h"
#import "UserProxy.h"

@interface ShareData : NSObject

@property(nonatomic,retain) NSArray *cookies;
@property(nonatomic,retain) NSMutableArray *arrListBonus;
@property(nonatomic,retain) NSString *selectedLanguage;
@property(nonatomic,retain) AppProxy *appProxy;
@property(nonatomic,retain) UserProxy *userProxy;
@property(nonatomic,retain) NSString *crUserEmail;

+ (ShareData *)instance;

@end
