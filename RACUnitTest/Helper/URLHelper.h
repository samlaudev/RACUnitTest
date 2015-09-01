//
//  URLHelper.h
//  MeiTuanWaiMai
//
//  Created by Sam Lau on 7/16/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//


#import <Foundation/Foundation.h>

//static NSString *const BaseURL = @"http://192.168.1.101:12306";
static NSString *const BaseURL = @"http://192.168.0.119:12306";

@interface URLHelper : NSObject

+ (NSString *)URLWithResourcePath:(NSString *)resourcePath;

@end
