//
//  KeyValueModel.m
//  RealTimeReq
//
//  Created by admin on 3/31/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "KeyValueModel.h"

@implementation KeyValueModel
@synthesize Values,Key;
-(id)initWithName:(NSString*)n description:(NSString*)desc{
    self.Values = desc;
    self.Key = n;
    return self;
}
@end
