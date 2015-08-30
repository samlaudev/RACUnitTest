//
//  LoginClient.m
//  RACUnitTest
//
//  Created by Sam Lau on 8/30/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "LoginClient.h"
#import "RACSignal.h"
#import "URLHelper.h"

#import <AFNetworking-RACExtensions/AFHTTPSessionManager+RACSupport.h>

@implementation LoginClient

+ (RACSignal *)loginWithUsername:(NSString *)username password:(NSString *)password
{
    return [[AFHTTPSessionManager manager] rac_GET:[URLHelper URLWithResourcePath:@"/v1/login"] parameters:@{
            @"username": username,
            @"password": password
    }];
}

@end
