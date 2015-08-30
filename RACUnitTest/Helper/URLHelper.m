//
//  URLHelper.m
//  MeiTuanWaiMai
//
//  Created by Sam Lau on 7/16/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "URLHelper.h"

@implementation URLHelper

+ (NSString *)URLWithResourcePath:(NSString *)resourcePath
{
    return [NSString stringWithFormat:@"%@%@", BaseURL, resourcePath];
}


@end
