//
//  ToggleView.m
//  ToggleView
//
//  Created by SOMTD on 12/10/14.
//  Copyright (c) 2012年 somtd.com. All rights reserved.
//

#import "ToggleView.h"

//replace sample image files
NSString *const TOGGLE_BASE_IMAGE        = @"toggle_base.png";
NSString *const TOGGLE_BUTTON_IMAGE      = @"toggle_button.png";
NSString *const TOGGLE_VIEW_BACKGROUND   = @"background.png";
NSString *const LEFT_BUTTON_IMAGE        = @"left_button.png";
NSString *const LEFT_BUTTON_IMAGE_SEL    = @"left_button_off.png";
NSString *const RIGHT_BUTTON_IMAGE       = @"right_button_on.png";
NSString *const RIGHT_BUTTON_IMAGE_SEL   = @"right_button_off.png";

@implementation ToggleView 
@synthesize  toggleDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
//        self.backgroundColor = [UIColor clearColor];
//        UIImageView *bgImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:TOGGLE_VIEW_BACKGROUND]];
//        [self addSubview:bgImageView];
        
        //set up toggle base image.
        _toggleBase = [[UIImageView alloc]initWithImage:[UIImage imageNamed:TOGGLE_BASE_IMAGE]];
        _toggleBase.center = CGPointMake(160, 26);
        [self addSubview:_toggleBase];
        
        //set up toggle left label image. 
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton setFrame:CGRectMake(0, 0, 72, 72)];
        [_leftButton setImage:[UIImage imageNamed:LEFT_BUTTON_IMAGE] forState:UIControlStateNormal];
        [_leftButton setImage:[UIImage imageNamed:LEFT_BUTTON_IMAGE_SEL] forState:UIControlStateSelected];
        [_leftButton addTarget:self action:@selector(onLeftButton:) forControlEvents:UIControlEventTouchUpInside];
        _leftButton.center = CGPointMake(80, 26);
        [self addSubview:_leftButton];
        
        //set up toggle right label image.
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightButton setFrame:CGRectMake(0, 0, 72, 72)];
        [_rightButton setImage:[UIImage imageNamed:RIGHT_BUTTON_IMAGE] forState:UIControlStateNormal];
        [_rightButton setImage:[UIImage imageNamed:RIGHT_BUTTON_IMAGE_SEL] forState:UIControlStateSelected];
        [_rightButton addTarget:self action:@selector(onRightButton:) forControlEvents:UIControlEventTouchUpInside];
        _rightButton.center = CGPointMake(240, 26);
        [self addSubview:_rightButton];
        
        //set up toggle button image.
        _togleButton = [[UIImageView alloc]initWithImage:[UIImage imageNamed:TOGGLE_BUTTON_IMAGE]];
        _togleButton.userInteractionEnabled = YES;
        _togleButton.center = CGPointMake(140, 27);
        [self addSubview:_togleButton];
        
        UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
        [_togleButton addGestureRecognizer:panGesture];
        
        _leftButton.selected = YES;
        _rightButton.selected = NO;
        // Initialization code
    }
    return self;
}

- (void)onLeftButton:(id)sender
{
    [UIView animateWithDuration:0.1f animations:^{
        _togleButton.center = CGPointMake(140.f,27.f);
    }];
    _leftButton.selected = YES;
    _rightButton.selected = NO;
    [self.toggleDelegate selectLeftButton];
}

- (void)onRightButton:(id)sender
{
    [UIView animateWithDuration:0.1f animations:^{
        _togleButton.center = CGPointMake(180.f,27.f);
    }];
    _leftButton.selected = NO;
    _rightButton.selected = YES;
    [self.toggleDelegate selectRightButton];
}

- (void)handlePanGesture:(UIPanGestureRecognizer*) sender {
    
    CGPoint startPoint;
    CGPoint nowPoint;
    CGPoint endPoint;
    float distance;
    if (sender.state == UIGestureRecognizerStateBegan) {
        startPoint = [sender locationInView:_togleButton];
    }
    
    if (sender.state == UIGestureRecognizerStateChanged) {
        nowPoint = [sender locationInView:_togleButton];
        
        distance = nowPoint.x-startPoint.x;
        NSLog(@"distance:%f", distance);
        if (_togleButton.center.x + distance > 180.f)
        {
            _togleButton.center = CGPointMake(180.f, _togleButton.center.y);
        }
        else if (_togleButton.center.x + distance < 140.f)
        {
            _togleButton.center = CGPointMake(140.f, _togleButton.center.y);
        }
        else
        {
            _togleButton.center = CGPointMake(_togleButton  .center.x + distance, _togleButton.center.y);
        }
    }
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        endPoint = [sender locationInView:_togleButton];
        if (_togleButton.center.x > 160.f)
        {
            [UIView animateWithDuration:0.1f animations:^{
                _togleButton.center = CGPointMake(180.f,27.f);
            }];
            _leftButton.selected = NO;
            _rightButton.selected = YES;
            [self.toggleDelegate selectRightButton];
        }
        else
        {
            [UIView animateWithDuration:0.1f animations:^{
                _togleButton.center = CGPointMake(140.f,27.f);
            }];
            _leftButton.selected = YES;
            _rightButton.selected = NO;
            [self.toggleDelegate selectLeftButton];
        }
        
    }
}

@end
