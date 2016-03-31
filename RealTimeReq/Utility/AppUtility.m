//
//  AppUtility.m
//  RealTimeReq
//
//  Created by admin on 3/31/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "AppUtility.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#include <arpa/inet.h>
#import "Reachability.h"

static dispatch_queue_t networkQueue;


@implementation AppUtility{
    Reachability* hostReachable;
}

+(NSString*)getURLStringFromDictionary:(NSDictionary*)dictionary{
    NSMutableString *urlStringWithDetails = [NSMutableString stringWithString:@""];
    NSInteger count = [[dictionary allKeys]count];
    
    for(NSString *string in [dictionary allKeys]){
        
        if([[dictionary allKeys] indexOfObject:string] < count-1){
            [urlStringWithDetails appendFormat:@"%@=%@&", string, dictionary[string]];
        }else{
            [urlStringWithDetails appendFormat:@"%@=%@", string, dictionary[string]];
        }
    }
    NSString *finalString = [NSString stringWithString:urlStringWithDetails];
    urlStringWithDetails = nil;
    return finalString;
}



#pragma mark - Object Misc Methods
+(AppDelegate*)getAppDelegate{
    return (AppDelegate*)[[UIApplication sharedApplication] delegate];
}


+(NSString*) languageSelectedStringForKey:(NSString*) key
{
    ShareData *shared = [ShareData instance];
    NSString *path;
    if(!shared.selectedLanguage){
        NSString *lag =[[NSLocale preferredLanguages] objectAtIndex:0];
        if ([lag isEqualToString:@"ko"]) {
            path = [[NSBundle mainBundle] pathForResource:lag ofType:@"lproj"];
        }else{
            path = [[NSBundle mainBundle] pathForResource:@"en" ofType:@"lproj"];
        }
    }
    else if([shared.selectedLanguage isEqualToString:@"ko"])
        path = [[NSBundle mainBundle] pathForResource:@"ko" ofType:@"lproj"];
    else
        path = [[NSBundle mainBundle] pathForResource:@"en" ofType:@"lproj"];
    NSBundle* languageBundle = [NSBundle bundleWithPath:path];
    NSString* str=[languageBundle localizedStringForKey:key value:path table:nil];
    return str;
}

#pragma mark - Handle connectoURL


#pragma mark - frame
+ (CGSize)getScreenFrameSize {
    float screenHeight = [[UIScreen mainScreen] applicationFrame].size.height+20;
    float screenWidth = [[UIScreen mainScreen] applicationFrame].size.width;
    if (( [UIApplication sharedApplication].statusBarOrientation == UIDeviceOrientationLandscapeRight)
        ||( [UIApplication sharedApplication].statusBarOrientation == UIDeviceOrientationLandscapeLeft))
    {
        screenWidth = screenHeight;
        screenHeight = [[UIScreen mainScreen] applicationFrame].size.width;
    }
    return CGSizeMake(screenWidth, screenHeight);
}

#pragma mark - Image
+ (UIImage *)imageByOverwriteColor:(UIColor *)color alpha:(float)alpha image:(UIImage*)image {
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    CGSize newSize = CGSizeMake(image.size.width, image.size.height);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, screenScale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [image drawInRect:CGRectMake(0,0,newSize.width, newSize.height) blendMode:(kCGBlendModeSourceOut) alpha:1];
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextSetBlendMode(context, kCGBlendModeSourceAtop);
    CGContextSetAlpha(context, alpha);
    CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(CGPointZero.x, CGPointZero.y, newSize.width, newSize.height));
    
    UIImage* resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

+ (UIImage *)imageWithImage:(UIImage *)image convertToSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return destImage;
}

+ (UIImage *)imageWithImage:(UIImage *)image convertToSize:(CGSize)size point:(CGPoint)xy
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [image drawInRect:CGRectMake(xy.x, xy.y, size.width, size.height)];
    UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return destImage;
}

+ (UIImage *)imageWithImageHeight:(UIImage *)image height:(float)height
{
    CGSize itemSize = CGSizeMake( image.size.width*height/image.size.height, height);
    UIGraphicsBeginImageContextWithOptions(itemSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, image.size.width*height/image.size.height, height)];
    UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return destImage;
}



#pragma mark - Handle string
+ (NSString*)checkNULLString:(NSString*)input {
    if(![input isEqualToString:@"<null>" ])
        return input;
    else
        return @"";
}
#pragma mark - CHECK NETWORK AVAILABILITY
+(BOOL)isNetworkAvailable{
    Reachability *hostReachability= [Reachability reachabilityWithHostName:API_URL];
    NetworkStatus netStatus= [hostReachability currentReachabilityStatus];
    BOOL connectionRequired = [hostReachability connectionRequired];
    switch (netStatus)
    {
        case NotReachable:{
            connectionRequired = NO;
            break;
        }
        case ReachableViaWWAN:{
            // Connect by 3G
            connectionRequired =YES;
            break;
        }
        case ReachableViaWiFi:{
            //Connect by wifi
            connectionRequired =YES;
            break;
        }
    }
    
    return connectionRequired;
}

+ (BOOL)isIpAddress:(NSString*)string{
    if (!string) {
        return FALSE;
    }
    struct in_addr pin;
    int success = inet_aton([string UTF8String],&pin);
    if (success == 1) return TRUE;
    return FALSE;
}

+ (void)saveUserDefaults:(NSDictionary *)dictionary {
    // Store the data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *array = dictionary.allKeys ;
    for(NSString *key in array){
        NSString *value = [dictionary objectForKey:key];
        [defaults setObject:value forKey:key];
    }
    
    [defaults synchronize];
}

+ (id)getUserDefaults:(NSString *)key {
    // Get the stored data before the view loads
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id value = [defaults objectForKey:key];
    return value;
}

@end
