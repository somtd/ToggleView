//
//  SampleViewController.h
//  ToggleView
//
//  Created by SOMTD on 12/10/14.
//  Copyright (c) 2012年 somtd.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToggleView.h"

@interface SampleViewController : UIViewController <ToggleViewDelegate>

@property(nonatomic, strong)ToggleView *toggleViewWithLabel;
@property(nonatomic, strong)ToggleView *toggleViewWithoutLabel;
@property(nonatomic, strong)ToggleView *toggleViewBaseChange;
@property(nonatomic, strong)ToggleView *toggleViewButtonChange;

@end
