//
//  BaseProxy.h
//  RealTimeReq
//
//  Created by admin on 3/31/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseOperation.h"


#define HTTPDOMAIN API_URL

typedef void (^DidGetItemsBlock)(NSArray *result, NSString *errorCode, NSString *message);
typedef void (^DidGetResultBlock)(id result, NSString *errorCode, NSString *message);
typedef void (^DidActionBlock)(id obj);


@interface BaseProxy : NSObject
//@property (nonatomic, copy) ErrorBlock errorHandler;

/*!Error Handel is method handle when is error*/
//- (void)handleError:(NSError *)error;
@end
