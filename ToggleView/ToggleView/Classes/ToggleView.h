//
//  ToggleView.h
//  ToggleView
//
//  Created by SOMTD on 12/10/14.
//  Copyright (c) 2012年 somtd.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ToggleButton;
@class ToggleBase;

@protocol ToggleViewDelegate;

typedef enum{
    ToggleViewTypeWithLabel,
    ToggleViewTypeNoLabel,
}ToggleViewType;

@interface ToggleView : UIView <UIGestureRecognizerDelegate>
{
    id<ToggleViewDelegate> _toggleDelegate;
    
    float _leftEdge;
    float _rightEdge;
    
    ToggleButton *_toggleButton;
    ToggleBase *_toggleBase;
    UIButton *_leftButton;
    UIButton *_rightButton;
    
}
@property (nonatomic, assign) id<ToggleViewDelegate> toggleDelegate;
@end

@protocol ToggleViewDelegate <NSObject>
- (void)selectLeftButton;
- (void)selectRightButton;
@end
