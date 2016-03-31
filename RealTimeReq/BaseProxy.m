//
//  BaseProxy.m
//  RealTimeReq
//
//  Created by admin on 3/31/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "BaseProxy.h"

@implementation BaseProxy


- (id)init
{
    self = [super init];
    if (self) {
     
    }
    return self;
}

//#pragma mark - Error handler
//- (void)handleError:(NSError *)error
//{
//    self.errorHandler(error);
//}

#pragma mark support function
- (BOOL)isNumber:(NSString *)str {
    NSScanner *scanner = [NSScanner scannerWithString:str];
    return [scanner scanInteger:NULL] && [scanner isAtEnd];
}

@end
