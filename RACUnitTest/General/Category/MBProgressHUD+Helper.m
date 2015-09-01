//
// Created by Sam Lau on 7/11/15.
// Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "MBProgressHUD+Helper.h"


@implementation MBProgressHUD (Helper)

+ (void)showMessage:(NSString *)message onView:(UIView *)view
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];

    // configure for text
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1.5];
}

@end