//
//  LoginClient.h
//  RACUnitTest
//
//  Created by Sam Lau on 8/30/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//


#import <Foundation/Foundation.h>

@class RACSignal;

@interface LoginClient : NSObject

+ (RACSignal *)loginWithUsername:(NSString *)username password:(NSString *)password;

@end
