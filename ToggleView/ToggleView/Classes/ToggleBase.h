//
//  ToggleBase.h
//  ToggleView
//
//  Created by SOMTD on 12/10/15.
//  Copyright (c) 2012年 somtd.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum{
    ToggleBaseTypeDefault,
    ToggleBaseTypeChangeImage,
}ToggleBaseType;

@interface ToggleBase : UIImageView

- (id)initWithImage:(UIImage *)image baseType:(ToggleBaseType)baseType;
- (void)selectedLeftToggleBase;
- (void)selectedRightToggleBase;

@end
