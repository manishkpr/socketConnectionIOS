//
//  AppUtility.h
//  RealTimeReq
//
//  Created by admin on 3/31/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppUtility : NSObject


+(NSString*)getURLStringFromDictionary:(NSDictionary*)dictionary;

#pragma mark - Object Misc Methods
+(AppDelegate*)getAppDelegate;


+(NSString*) languageSelectedStringForKey:(NSString*) key;

#pragma mark - Image
+ (UIImage *)imageWithImage:(UIImage *)image convertToSize:(CGSize)size;
+ (UIImage *)imageWithImage:(UIImage *)image convertToSize:(CGSize)size point:(CGPoint)xy;
+ (UIImage *)imageWithImageHeight:(UIImage *)image height:(float)height;
+ (UIImage *)imageByOverwriteColor:(UIColor *)color alpha:(float)alpha image:(UIImage*)image;


#pragma mark - Handle string
+ (NSString *)checkNULLString:(NSString*)input;
//============== CHECK NETWORK AVAILABILITY =================
+(BOOL)isNetworkAvailable;
+ (BOOL)isIpAddress:(NSString*)string;

#pragma mark - UserDefaults
+ (void)saveUserDefaults:(NSDictionary *)dictionary;
+ (id)getUserDefaults:(NSString *)key;


@end



