//
//  ToggleBase.m
//  ToggleView
//
//  Created by SOMTD on 12/10/15.
//  Copyright (c) 2012年 somtd.com. All rights reserved.
//

#import "ToggleBase.h"

//change base image option
NSString *const TOGGLE_BASE_IMAGE_L     = @"toggle_base_l.png";
NSString *const TOGGLE_BASE_IMAGE_R     = @"toggle_base_r.png";

@implementation ToggleBase

- (id)initWithImage:(UIImage *)image baseType:(ToggleBaseType)baseType
{
    self = [super initWithImage:image];
    if (self) {
        if (baseType == ToggleBaseTypeChangeImage)
        {
            //default select "L"
            self.image = [UIImage imageNamed:TOGGLE_BASE_IMAGE_L];
            return self;
        }
    }
    return self;
}

- (void)selectedLeftToggleBase
{
    self.image = [UIImage imageNamed:TOGGLE_BASE_IMAGE_L];
}

- (void)selectedRightToggleBase
{
    self.image = [UIImage imageNamed:TOGGLE_BASE_IMAGE_R];
}

@end
