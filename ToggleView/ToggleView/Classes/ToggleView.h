//
//  ToggleView.h
//  ToggleView
//
//  Created by SOMTD on 12/10/14.
//  Copyright (c) 2012年 somtd.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ToggleViewDelegate;

typedef enum{
    ToggleViewTypeWithLabel,
    ToggleViewTypeWithoutLabel,
}ToggleViewType;

@interface ToggleView : UIView <UIGestureRecognizerDelegate>
{
    id<ToggleViewDelegate> _toggleDelegate;
    UIImageView *_togleButton;
    UIButton *_leftButton;
    UIButton *_rightButton;
    UIImageView *_toggleBase;
}
@property (nonatomic, assign) id<ToggleViewDelegate> toggleDelegate;
@end

@protocol ToggleViewDelegate <NSObject>
- (void)selectLeftButton;
- (void)selectRightButton;
@end
