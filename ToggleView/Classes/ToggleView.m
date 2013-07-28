//
//  ToggleView.m
//  ToggleView
//
//  Created by SOMTD on 12/10/14.
//  Copyright (c) 2012年 somtd.com. All rights reserved.
//

#import "ToggleView.h"
#import "ToggleButton.h"
#import "ToggleBase.h"
//replace sample image files
NSString *const TOGGLE_BUTTON_IMAGE      = @"toggle_button.png";
NSString *const TOGGLE_BASE_IMAGE        = @"toggle_base.png";
NSString *const TOGGLE_VIEW_BACKGROUND   = @"background.png";
NSString *const LEFT_BUTTON_IMAGE        = @"left_button_on.png";
NSString *const LEFT_BUTTON_IMAGE_SEL    = @"left_button_off.png";
NSString *const RIGHT_BUTTON_IMAGE       = @"right_button_on.png";
NSString *const RIGHT_BUTTON_IMAGE_SEL   = @"right_button_off.png";

#define LEFT_BUTTON_RECT CGRectMake(0, 0, 72.f, 72.f)
#define RIGHT_BUTTON_RECT CGRectMake(0, 0, 72.f, 72.f)
#define TOGGLE_SLIDE_DULATION 0.1f

@implementation ToggleView 
@synthesize toggleDelegate;
@synthesize viewType;

- (id)initWithFrame:(CGRect)frame
     toggleViewType:(ToggleViewType)aViewType
     toggleBaseType:(ToggleBaseType)aBaseType
   toggleButtonType:(ToggleButtonType)aButtonType
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.viewType = aViewType;
        
        self.backgroundColor = [UIColor clearColor];
        UIImageView *bgImageView = [[UIImageView alloc]initWithImage:
                                    [UIImage imageNamed:TOGGLE_VIEW_BACKGROUND]];
        [self addSubview:bgImageView];
        
        //set up toggle base image.
        _toggleBase = [[ToggleBase alloc]initWithImage:[UIImage imageNamed:TOGGLE_BASE_IMAGE] baseType:aBaseType];
        _toggleBase.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        _toggleBase.userInteractionEnabled = YES;
        
        //set up toggle button image.
        _toggleButton = [[ToggleButton alloc]initWithImage:[UIImage imageNamed:TOGGLE_BUTTON_IMAGE] buttonType:aButtonType];
        _toggleButton.userInteractionEnabled = YES;
        
        CGRect baseViewFrame = CGRectMake(_toggleBase.frame.origin.x + _toggleButton.frame.size.width/2,
                                          _toggleBase.frame.origin.y,
                                          _toggleBase.frame.size.width - _toggleButton.frame.size.width,
                                          _toggleBase.frame.size.height);
        _baseView = [[UIView alloc]initWithFrame:baseViewFrame];
        [self addSubview:_baseView];
        
        //calculate left/right edge
        _leftEdge = _toggleBase.frame.origin.x + _toggleButton.frame.size.width/2;
        _rightEdge = _toggleBase.frame.origin.x + _toggleBase.frame.size.width - _toggleButton.frame.size.width/2;
        _toggleButton.center = CGPointMake(_leftEdge, self.frame.size.height/2);
        
        if (self.viewType == ToggleViewTypeWithLabel)
        {
            //set up toggle left label image.
            _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [_leftButton setFrame:LEFT_BUTTON_RECT];
            [_leftButton setImage:[UIImage imageNamed:LEFT_BUTTON_IMAGE] forState:UIControlStateNormal];
            [_leftButton setImage:[UIImage imageNamed:LEFT_BUTTON_IMAGE_SEL] forState:UIControlStateSelected];
            [_leftButton addTarget:self action:@selector(onLeftButton:) forControlEvents:UIControlEventTouchUpInside];
            _leftButton.center = CGPointMake(_leftEdge - _leftButton.frame.size.width, _toggleBase.center.y);
            [self addSubview:_leftButton];
            
            //set up toggle right label image.
            _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [_rightButton setFrame:RIGHT_BUTTON_RECT];
            [_rightButton setImage:[UIImage imageNamed:RIGHT_BUTTON_IMAGE] forState:UIControlStateNormal];
            [_rightButton setImage:[UIImage imageNamed:RIGHT_BUTTON_IMAGE_SEL] forState:UIControlStateSelected];
            [_rightButton addTarget:self action:@selector(onRightButton:) forControlEvents:UIControlEventTouchUpInside];
            _rightButton.center = CGPointMake(_rightEdge + _rightButton.frame.size.width, _toggleBase.center.y);
            [self addSubview:_rightButton];
            
            _leftButton.selected = YES;
            _rightButton.selected = NO;
        }
        
        [self addSubview:_toggleBase];
        [self addSubview:_toggleButton];
        
        UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
        
        UITapGestureRecognizer* buttonTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleButtonTapGesture:)];
        
        UITapGestureRecognizer* baseTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleBaseTapGesture:)];
        
        [_toggleButton addGestureRecognizer:panGesture];
        [_toggleButton addGestureRecognizer:buttonTapGesture];
        [_toggleBase addGestureRecognizer:baseTapGesture];
    }
    return self;
}

- (void)onLeftButton:(id)sender
{
    [UIView animateWithDuration:TOGGLE_SLIDE_DULATION animations:^{
        _toggleButton.center = CGPointMake(_leftEdge, self.frame.size.height/2);
    }];
    if (self.viewType == ToggleViewTypeWithLabel)
    {
        _leftButton.selected = YES;
        _rightButton.selected = NO;
    }
    [_toggleBase selectedLeftToggleBase];
    [_toggleButton selectedLeftToggleButton];
    [self.toggleDelegate selectLeftButton];
}

- (void)onRightButton:(id)sender
{
    [UIView animateWithDuration:TOGGLE_SLIDE_DULATION animations:^{
        _toggleButton.center = CGPointMake(_rightEdge, self.frame.size.height/2);
    }];
    if (self.viewType == ToggleViewTypeWithLabel)
    {
        _leftButton.selected = NO;
        _rightButton.selected = YES;
    }
    [_toggleBase selectedRightToggleBase];
    [_toggleButton selectedRightToggleButton];
    [self.toggleDelegate selectRightButton];
}

- (void)setTogglePosition:(float)positonValue ended:(BOOL)isEnded
{
    if (!isEnded)
    {
        if (positonValue == 0.f)
        {
            _toggleButton.center = CGPointMake(_leftEdge, _toggleButton.center.y);
        }
        else if (positonValue == 1.f)
        {
            _toggleButton.center = CGPointMake(_rightEdge, _toggleButton.center.y);
        }
        else
        {
            _toggleButton.center = CGPointMake(_baseView.frame.origin.x + (positonValue * _baseView.frame.size.width), _toggleButton.center.y);
        }
        
    }
    else //isEnded == YES;
    {
        if (positonValue == 0.f)
        {
            _toggleButton.center = CGPointMake(_leftEdge, _toggleButton.center.y);
            [_toggleBase selectedLeftToggleBase];
            [_toggleButton selectedLeftToggleButton];
            [self.toggleDelegate selectLeftButton];
            
        }
        else if (positonValue == 1.f)
        {
            _toggleButton.center = CGPointMake(_rightEdge, _toggleButton.center.y);
            [_toggleBase selectedRightToggleBase];
            [_toggleButton selectedRightToggleButton];
            [self.toggleDelegate selectRightButton];
        }
        else if (positonValue > 0.f && positonValue < 0.5f)
        {
            [UIView animateWithDuration:TOGGLE_SLIDE_DULATION animations:^{
                _toggleButton.center = CGPointMake(_leftEdge, _toggleButton.center.y);
            } completion:^(BOOL finished) {
                [_toggleBase selectedLeftToggleBase];
                [_toggleButton selectedLeftToggleButton];
                [self.toggleDelegate selectLeftButton];
            }];
        }
        else if (positonValue >= 0.5f && positonValue < 1.f)
        {
            [UIView animateWithDuration:TOGGLE_SLIDE_DULATION animations:^{
                _toggleButton.center = CGPointMake(_rightEdge, _toggleButton.center.y);
            } completion:^(BOOL finished) {
                [_toggleBase selectedRightToggleBase];
                [_toggleButton selectedRightToggleButton];
                [self.toggleDelegate selectRightButton];
            }];
        }
    }
}

- (void)handleButtonTapGesture:(UITapGestureRecognizer*) sender {
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        if (_toggleButton.center.x == _rightEdge)
        {
            [UIView animateWithDuration:TOGGLE_SLIDE_DULATION animations:^{
                _toggleButton.center = CGPointMake(_leftEdge, _toggleButton.center.y);
            }completion:^(BOOL finished) {
                [_toggleBase selectedLeftToggleBase];
                [_toggleButton selectedLeftToggleButton];
                [self.toggleDelegate selectLeftButton];
            }];
        }
        else if (_toggleButton.center.x == _leftEdge)
        {
            [UIView animateWithDuration:TOGGLE_SLIDE_DULATION animations:^{
                _toggleButton.center = CGPointMake(_rightEdge, _toggleButton.center.y);
            }completion:^(BOOL finished) {
                [_toggleBase selectedRightToggleBase];
                [_toggleButton selectedRightToggleButton];
                [self.toggleDelegate selectRightButton];
            }];
        }
    }
}

- (void)handleBaseTapGesture:(UITapGestureRecognizer*) sender {
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        if (_toggleButton.center.x == _rightEdge)
        {
            [UIView animateWithDuration:TOGGLE_SLIDE_DULATION animations:^{
                _toggleButton.center = CGPointMake(_leftEdge, _toggleButton.center.y);
            }completion:^(BOOL finished) {
                [_toggleBase selectedLeftToggleBase];
                [_toggleButton selectedLeftToggleButton];
                [self.toggleDelegate selectLeftButton];
            }];
        }
        else if (_toggleButton.center.x == _leftEdge)
        {
            [UIView animateWithDuration:TOGGLE_SLIDE_DULATION animations:^{
                _toggleButton.center = CGPointMake(_rightEdge, _toggleButton.center.y);
            }completion:^(BOOL finished) {
                [_toggleBase selectedRightToggleBase];
                [_toggleButton selectedRightToggleButton];
                [self.toggleDelegate selectRightButton];
            }];
        }
    }
}


- (void)handlePanGesture:(UIPanGestureRecognizer*) sender {
        
    if (sender.state == UIGestureRecognizerStateBegan)
    {
        CGPoint currentPoint = [sender locationInView:_baseView];
        float position = currentPoint.x;
        float positionValue = position / _baseView.frame.size.width;
        
        if (positionValue < 1.f && positionValue > 0.f)
        {
            [self setTogglePosition:positionValue ended:NO];
        }
    }
    
    if (sender.state == UIGestureRecognizerStateChanged)
    {
        CGPoint currentPoint = [sender locationInView:_baseView];
        float position = currentPoint.x;
        float positionValue = position / _baseView.frame.size.width;
        
        if (positionValue < 1.f && positionValue > 0.f)
        {
            [self setTogglePosition:positionValue ended:NO];
        }
    }
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        
        CGPoint currentPoint = [sender locationInView:_baseView];
        float position = currentPoint.x;
        float positionValue = position / _baseView.frame.size.width;
        
        if (positionValue < 1.f && positionValue > 0.f)
        {
            [self setTogglePosition:positionValue ended:YES];
        }
        else if (positionValue >= 1.f)
        {
            [self setTogglePosition:1.f ended:YES];
        }
        else if (positionValue <= 0.f)
        {
            [self setTogglePosition:0.f ended:YES];
        }
    }
}

- (void)setSelectedButton:(ToggleButtonSelected)selectedButton
{
    switch (selectedButton) {
        case ToggleButtonSelectedLeft:
            [self onLeftButton:nil];
            break;
        case ToggleButtonSelectedRight:
            [self onRightButton:nil];
            break;
        default:
            break;
    }
}

@end
