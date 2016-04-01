//
//  UserProxy.h
//  RealTimeReq
//
//  Created by admin on 3/31/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "BaseProxy.h"

@interface UserProxy : BaseProxy

/*!Login with user name. arg1:UserName arg2:Password*/
- (void)doLogin:(NSString *)username password:(NSString *)password
completeHandler:(DidGetResultBlock)handler errorHandler:(ErrorBlock)errHandler;

- (void)doCreat:(NSString *)username Email:(NSString *)email password:(NSString *)password
completeHandler:(DidGetResultBlock)handler errorHandler:(ErrorBlock)errHandler;

- (void)getListUsers:(DidGetResultBlock)handler errorHandler:(ErrorBlock)errHandler;
@end
