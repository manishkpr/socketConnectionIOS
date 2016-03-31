//
//  RealTimeReqDefine.h
//  RealTimeReq
//
//  Created by admin on 3/30/16.
//  Copyright © 2016 admin. All rights reserved.
//

#ifndef RealTimeReqDefine_h
#define RealTimeReqDefine_h

#define FontThin @"STHeitiSC-Light"
#define FontBold @"STHeitiSC-Medium"
#define StringFormat(karg,...)  [NSString stringWithFormat:(karg),##__VA_ARGS__]

#define colorWithRGB(kred,kgreen,kblue,kalpha) [UIColor colorWithRed:kred/255.0f green:kgreen/255.0f blue:kblue/255.0f alpha:kalpha]

#define OSVersionIsAtLeastiOS7 return (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1)

#define NOTIFICATION_GET_HOME_SEVICE @"NOTIFICATION_GET_HOME_SEVICE"
#define NOTIFICATION_MOVIESPLAYER_FULLSCRENNSTATUS @"MOVIESPLAYER_FULLSCRENNSTATUS"

#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)
#define IS_IPHONE4 (([[UIScreen mainScreen] bounds].size.height-480)?NO:YES)
#define IS_OS_4_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 4.0)
#define IS_OS_5_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
#define IS_OS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define App_version @"1.1.0"
#define heightStatusBar 20
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define Mesage_Network @"Kết nối thất bại, Vui lòng kiểm tra lại đường truyền"
//Login
#define Mesage_Titile @"Thông báo"
#define Mesage_Login_Empty @"Vui lòng nhập user name và mật khẩu"
#define Mesage_Create_Empty @"Vui lòng nhập user name và mật khẩu"
#define Mesage_Login_Error @"UserName hoặc mật khẩu không đúng"
#define Mesage_DataEmpty @"Không tìm thấy kết quả"
#define TitleNotification @"Thông báo"
#define PHOTO_GALLARY_TAG 1000
#define NO_IMAGE @"no_image"
#define IMAGE_FOLDER [NSTemporaryDirectory()  stringByAppendingPathComponent:@"images"]
#define API_URL @"http://54.255.201.10"
#define MAIN_VIEW_SCREEN @"MainViewTableSeque"
#define LOGIN_NEW_SCREEN @"LoginViewScene"
#define MESSAGE_DISCONNECT @"Do you wannt to logout"
#endif /* RealTimeReqDefine_h */
