//
//  ItemRecord.h
//  RealTimeReq
//
//  Created by admin on 4/1/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "UserRecord.h"

@interface ItemRecord : NSObject

/*
 "salt": "$2a$10$acP.ygj8BV6llVTSA0BJyO",
 "provider": "local",
 "name": "hk",
 "email": "hk1@gmail.com",
 "password": "$2a$10$acP.ygj8BV6llVTSA0BJyOEYBsACgeLh/PPADHAfqVMp7/HqzJxPq",
 "_id": "5680dea0381384421526bb20",
 "__v": 0,
 "created": "2015-12-28T07:02:56.142Z",
 "avatar": "https://cdn4.iconfinder.com/data/icons/user-avatar-flat-icons/512/User_Avatar-33-512.png"

 
 */

@property (nonatomic,retain) NSString *salt;
@property (nonatomic,retain) NSString *provider;
@property (nonatomic,retain) NSString *email;
@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *created;
@property (nonatomic,retain) NSString *avatar;

@end
