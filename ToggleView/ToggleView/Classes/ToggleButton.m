//
//  ToggleButton.m
//  ToggleView
//
//  Created by SOMTD on 12/10/15.
//  Copyright (c) 2012年 somtd.com. All rights reserved.
//

#import "ToggleButton.h"

//change button image option
NSString *const TOGGLE_BUTTON_IMAGE_L    = @"toggle_button_l.png";
NSString *const TOGGLE_BUTTON_IMAGE_R    = @"toggle_button_r.png";


@implementation ToggleButton

- (id)initWithImage:(UIImage *)image buttonType:(ToggleButtonType)buttonType
{
    self = [super initWithImage:image];
    if (self) {
        if (buttonType == ToggleButtonTypeChangeImage)
        {
            //default select "L"
            self.image = [UIImage imageNamed:TOGGLE_BUTTON_IMAGE_L];
            return self;
        }
    }
    return self;
}

- (void)selectedLeftToggleButton
{
    self.image = [UIImage imageNamed:TOGGLE_BUTTON_IMAGE_L];
}

- (void)selectedRightToggleButton
{
    self.image = [UIImage imageNamed:TOGGLE_BUTTON_IMAGE_R];
}



@end
