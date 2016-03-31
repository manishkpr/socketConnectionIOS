//
//  UserRecord.m
//  RealTimeReq
//
//  Created by admin on 3/31/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "UserRecord.h"

@implementation UserRecord


@synthesize userName;
@synthesize userPass;
@synthesize provider;
@synthesize userEmail;
@synthesize userId;
@synthesize userCreated;
@synthesize userAvatar;
@synthesize userToken;


- (id)initWithCoder:(NSCoder *)aDecoder {
	if ((self = [self init])){
        self.userName = [aDecoder decodeObjectForKey:@"name"];
        self.userPass = [aDecoder decodeObjectForKey:@"userPass"];
        self.provider = [aDecoder decodeObjectForKey:@"provider"];
        self.userEmail = [aDecoder decodeObjectForKey:@"email"];
        self.userId = [aDecoder decodeObjectForKey:@"_id"];
        self.userCreated = [aDecoder decodeObjectForKey:@"created"];
        self.userAvatar = [aDecoder decodeObjectForKey:@"avatar"];
        self.userToken = [aDecoder decodeObjectForKey:@"token"];
    }
    return self;
}

@end
