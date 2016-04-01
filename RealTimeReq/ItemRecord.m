//
//  ItemRecord.m
//  RealTimeReq
//
//  Created by admin on 4/1/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "ItemRecord.h"

@implementation ItemRecord
@synthesize salt,provider,email,name,created,avatar;

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [self init])){
        self.salt = [aDecoder decodeObjectForKey:@"salt"];
        self.provider = [aDecoder decodeObjectForKey:@"provider"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.created = [aDecoder decodeObjectForKey:@"created"];
        self.avatar = [aDecoder decodeObjectForKey:@"avatar"];
    }
    return self;
}
@end
