//
//  UserRecord.h
//  RealTimeReq
//
//  Created by admin on 3/31/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserRecord : NSObject

@property (nonatomic,retain) NSString *userName;
@property (nonatomic,retain) NSString *userPass;
@property (nonatomic,retain) NSString *provider;
@property (nonatomic,retain) NSString *userEmail;
@property (nonatomic,retain) NSString *userId;
@property (nonatomic,retain) NSString *userCreated;
@property (nonatomic,retain) NSString *userAvatar;

@property (nonatomic,retain) NSString *userToken;

@end
