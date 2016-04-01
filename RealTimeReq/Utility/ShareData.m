//
//  ShareData.m
//  RealTimeReq
//
//  Created by admin on 3/31/16.
//  Copyright © 2016 admin. All rights reserved.
//
#import "ShareData.h"

@implementation ShareData
@synthesize appProxy;
@synthesize userProxy;
@synthesize tocket;
//Uer
@synthesize crUserEmail;

static ShareData *_instance = nil;

- (id)init
{
    self = [super init];
    if (self) {
        appProxy = [[AppProxy alloc] init];
        userProxy = [[UserProxy alloc] init];
    }
    
    return self;
}

+ (ShareData *)instance {
    @synchronized(self)
    {
        if(_instance == nil)
        {
            _instance= [ShareData new];
            
        }
    }
    return _instance;
}

@end
