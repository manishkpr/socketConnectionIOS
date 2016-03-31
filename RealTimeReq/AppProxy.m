//
//  AppProxy.m
//  RealTimeReq
//
//  Created by admin on 3/31/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "AppProxy.h"
#import "KeyValueModel.h"
#import "UserRecord.h"
#import "ShareData.h"

#define mGetMenuByUser                          @"GetMenuByUser"
#define mGetVersion                             @"GetVersion"
#define mCheckIMEI                              @"CheckImei"

@implementation AppProxy
///CheckRegistration
-(void)CheckRegistration:(NSMutableDictionary *)dicIn completionHandler:(DidGetResultBlock)handler errorHandler:(ErrorBlock)errHandler{
    BaseOperation * callOp = [[BaseOperation alloc] init];
    NSURL *url = [NSURL URLWithString:StringFormat(@"%@/%@",urlAPI, @"CheckRegistration")];

    callOp.request = [NSMutableURLRequest requestWithURL:url];
    
    //create json
    NSString *postString = @"";
//    postString = [dicIn JSONRepresentation];
    
    [(NSMutableURLRequest*)callOp.request setHTTPMethod:@"POST"];
    [(NSMutableURLRequest*)callOp.request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [(NSMutableURLRequest*)callOp.request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    callOp.completionHandler = ^(NSData *result, NSURLResponse *res) {
        [self endCheckRegistration:result response:res completionHandler:handler errorHandler:errHandler];
    };
    callOp.errorHandler = ^(NSError *err) {
        errHandler(err);
    };
    [callOp start];
    
    
}
-(void)endCheckRegistration:(NSData *)result response:(NSURLResponse *)response completionHandler:(DidGetItemsBlock)handler errorHandler:(ErrorBlock)errHandler {
    NSInteger httpCode = [(NSHTTPURLResponse*)response statusCode];
    if(httpCode != 200){
        NSError *err = [[NSError alloc] initWithDomain:HTTPDOMAIN code:httpCode userInfo:nil];
        errHandler(err);
        return;
    }
    /*Parse json response*/
//    NSDictionary *jsonDict = [self.parser objectWithData:result];
//    NSString *data = [jsonDict objectForKey:@"CheckRegistrationResult"]?:nil;
//    
//    if(data == nil){
//        handler(nil, @"-1", @"Không có dữ liệu");
//        return;
//    }
//    NSMutableArray *arr = [NSMutableArray new];
//    arr[0]=data;
//    handler(arr, @"", @"");
    
}


//GetDeployAppointmentList
-(void)GetDeployAppointmentList:(NSMutableDictionary *)dicIn completionHandler:(DidGetResultBlock)handler errorHandler:(ErrorBlock)errHandler{
    BaseOperation * callOp = [[BaseOperation alloc] init];
    NSURL *url = [NSURL URLWithString:StringFormat(@"%@/%@",urlAPI, @"GetDeployAppointmentList")];
   // NSURL *url =[NSURL URLWithString:StringFormat(@"http://beta.wsmobisale.fpt.net/MobiSaleService.svc/GetDeployAppointmentList")];
    callOp.request = [NSMutableURLRequest requestWithURL:url];
    
    //create json
    NSString *postString = @"";
//    postString = [dicIn JSONRepresentation];
    
    [(NSMutableURLRequest*)callOp.request setHTTPMethod:@"POST"];
    [(NSMutableURLRequest*)callOp.request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [(NSMutableURLRequest*)callOp.request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    callOp.completionHandler = ^(NSData *result, NSURLResponse *res) {
        [self endGetDeployAppointmentList:result response:res completionHandler:handler errorHandler:errHandler];
    };
    callOp.errorHandler = ^(NSError *err) {
        errHandler(err);
    };
    [callOp start];
    
    
}
-(void)endGetDeployAppointmentList:(NSData *)result response:(NSURLResponse *)response completionHandler:(DidGetItemsBlock)handler errorHandler:(ErrorBlock)errHandler {
    NSInteger httpCode = [(NSHTTPURLResponse*)response statusCode];
    if(httpCode != 200){
        NSError *err = [[NSError alloc] initWithDomain:HTTPDOMAIN code:httpCode userInfo:nil];
        errHandler(err);
        return;
    }
    /*Parse json response*/
//    NSDictionary *jsonDict = [self.parser objectWithData:result];
//    NSDictionary *data = [jsonDict objectForKey:@"ResponseResult"]?:nil;
//    if(data == nil){
//        return;
//    }
//    NSString *ErrorCode = StringFormat(@"%@",[data objectForKey:@"ErrorCode"]);
//    if(![ErrorCode isEqualToString:@"0"]){
//        handler(nil, ErrorCode, ErrorCode);
//        return;
//    }
//    NSArray *arr = [data objectForKey:@"ListObject"]?:nil;
//    
//    handler((NSArray *)arr, ErrorCode, @"");
    
}



@end
