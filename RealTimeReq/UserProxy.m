//
//  UserProxy.m
//  RealTimeReq
//
//  Created by admin on 3/31/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "UserProxy.h"
#import "ShareData.h"
#import "UserRecord.h"

#define methodLogin         @"9000/auth/signin"
#define methodCreate         @"9000/create"

@implementation UserProxy

#pragma mark LOGIN
- (void)doLogin:(NSString *)username password:(NSString *)password
completeHandler:(DidGetResultBlock)handler errorHandler:(ErrorBlock)errHandler {
    
    BaseOperation * callOp = [[BaseOperation alloc] init];
    NSURL *url = [NSURL URLWithString:StringFormat(@"%@:%@",urlAPI, methodLogin)];
    callOp.request = [NSMutableURLRequest requestWithURL:url];
   
    NSString *postString = [NSString stringWithFormat:@"password=%@&email=%@",password,username];
  
    [(NSMutableURLRequest*)callOp.request setHTTPMethod:@"POST"];
    
    [(NSMutableURLRequest*)callOp.request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [(NSMutableURLRequest*)callOp.request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)postString.length] forHTTPHeaderField:@"Content-Length"];
    
    [(NSMutableURLRequest*)callOp.request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    callOp.completionHandler = ^(NSData *result, NSURLResponse *res) {
        [self endLogin:result response:res completionHandler:handler errorHandler:errHandler];
    };
    
    callOp.errorHandler = ^(NSError *err) {
        errHandler(err);
    };
    
    [callOp start];
}

- (void)endLogin:(NSData *)result response:(NSURLResponse *)response
completionHandler:(DidGetResultBlock)handler errorHandler:(ErrorBlock)errHandler {
    
    NSInteger httpCode = [(NSHTTPURLResponse*)response statusCode];
    if(httpCode == 201 || httpCode == 200){
        //    /*Login success*/
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:result
                                                             options:kNilOptions
                                                               error:&error];
        NSDictionary* userInfo = [[NSDictionary alloc] init];
        userInfo = [json objectForKey:@"user"];
        
        UserRecord *rc = [[UserRecord alloc] init];
        rc.userToken = StringFormat(@"%@",[json objectForKey:@"token"]);
        rc.provider = StringFormat(@"%@",[userInfo objectForKey:@"provider"]);
        rc.userName = StringFormat(@"%@",[userInfo objectForKey:@"name"]);
        rc.userCreated = StringFormat(@"%@",[userInfo objectForKey:@"created"]);
        rc.userEmail = StringFormat(@"%@",[userInfo objectForKey:@"email"]);
        rc.userAvatar = StringFormat(@"%@",[userInfo objectForKey:@"avatar"]);
        NSString *errorCode = StringFormat(@"%@",error);;
        handler(rc, errorCode, @"");
        
    }else if (httpCode == 401){
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:result
                                                             options:kNilOptions
                                                               error:&error];
        errHandler([json objectForKey:@"message"]);
    }
    else{
        NSError *err = [[NSError alloc] initWithDomain:HTTPDOMAIN code:httpCode userInfo:nil];
        errHandler(err);
    }
}

#pragma mark CREATE
- (void)doCreat:(NSString *)username Email:(NSString *)email password:(NSString *)password
completeHandler:(DidGetResultBlock)handler errorHandler:(ErrorBlock)errHandler {
    
    BaseOperation * callOp = [[BaseOperation alloc] init];
    NSURL *url = [NSURL URLWithString:StringFormat(@"%@:%@",urlAPI, methodCreate)];

    callOp.request = [NSMutableURLRequest requestWithURL:url];
    //password=password&email=password1%40gmail.com&name=thomas

    NSString *postString = [NSString stringWithFormat:@"password=%@&email=%@&name=%@",password,email,username];
    
    [(NSMutableURLRequest*)callOp.request setHTTPMethod:@"POST"];
    
    [(NSMutableURLRequest*)callOp.request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [(NSMutableURLRequest*)callOp.request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)postString.length] forHTTPHeaderField:@"Content-Length"];
    
    [(NSMutableURLRequest*)callOp.request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    callOp.completionHandler = ^(NSData *result, NSURLResponse *res) {
        [self endCreate:result response:res completionHandler:handler errorHandler:errHandler];
    };
    
    callOp.errorHandler = ^(NSError *err) {
        errHandler(err);
    };
    
    [callOp start];
}

- (void)endCreate:(NSData *)result response:(NSURLResponse *)response
completionHandler:(DidGetResultBlock)handler errorHandler:(ErrorBlock)errHandler {
    
    NSInteger httpCode = [(NSHTTPURLResponse*)response statusCode];
    if(httpCode == 201 || httpCode == 400){
        //    /*Login success*/
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:result
                                                             options:kNilOptions
                                                               error:&error];
        NSDictionary* userInfo = [[NSDictionary alloc] init];
        userInfo = [json objectForKey:@"user"];
        
        UserRecord *rc = [[UserRecord alloc] init];
        rc.userToken = StringFormat(@"%@",[json objectForKey:@"token"]);
        rc.provider = StringFormat(@"%@",[userInfo objectForKey:@"provider"]);
        rc.userName = StringFormat(@"%@",[userInfo objectForKey:@"name"]);
        rc.userCreated = StringFormat(@"%@",[userInfo objectForKey:@"created"]);
        rc.userEmail = StringFormat(@"%@",[userInfo objectForKey:@"email"]);
        rc.userAvatar = StringFormat(@"%@",[userInfo objectForKey:@"avatar"]);
        NSString *errorCode = StringFormat(@"%@",error);;
        handler(rc, errorCode, @"");
        
    }else if (httpCode == 401){
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:result
                                                             options:kNilOptions
                                                               error:&error];
        errHandler([json objectForKey:@"message"]);
    }
    else{
        NSError *err = [[NSError alloc] initWithDomain:HTTPDOMAIN code:httpCode userInfo:nil];
        errHandler(err);
    }
}

@end
