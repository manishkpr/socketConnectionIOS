//
//  KeyValueModel.h
//  RealTimeReq
//
//  Created by admin on 3/31/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyValueModel : NSObject{
    NSString *Values;
    NSString *Key;
}
@property(nonatomic,copy)NSString *Values;
@property(nonatomic,copy)NSString *Key;

-(id)initWithName:(NSString*)n description:(NSString *)desc;

@end
