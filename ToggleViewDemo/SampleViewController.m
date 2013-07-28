//
//  SampleViewController.m
//  ToggleView
//
//  Created by SOMTD on 12/10/14.
//  Copyright (c) 2012年 somtd.com. All rights reserved.
//

#import "SampleViewController.h"

@interface SampleViewController ()

@end

@implementation SampleViewController
@synthesize toggleViewWithLabel;
@synthesize toggleViewWithoutLabel;
@synthesize toggleViewBaseChange;
@synthesize toggleViewButtonChange;

- (void)viewDidLoad
{
    [super viewDidLoad];
    toggleViewWithLabel = [[ToggleView alloc]initWithFrame:CGRectMake(0, 50, 320, 75) toggleViewType:ToggleViewTypeWithLabel toggleBaseType:ToggleBaseTypeDefault toggleButtonType:ToggleButtonTypeDefault];
    toggleViewWithLabel.toggleDelegate = self;

    toggleViewWithoutLabel = [[ToggleView alloc]initWithFrame:CGRectMake(0, 150, 320, 75) toggleViewType:ToggleViewTypeNoLabel toggleBaseType:ToggleBaseTypeDefault toggleButtonType:ToggleButtonTypeDefault];
    toggleViewWithoutLabel.toggleDelegate = self;
    
    toggleViewBaseChange = [[ToggleView alloc]initWithFrame:CGRectMake(0, 250, 320, 75) toggleViewType:ToggleViewTypeNoLabel toggleBaseType:ToggleBaseTypeChangeImage toggleButtonType:ToggleButtonTypeDefault];
    toggleViewBaseChange.toggleDelegate = self;
    
    toggleViewButtonChange = [[ToggleView alloc]initWithFrame:CGRectMake(0, 350, 320, 75) toggleViewType:ToggleViewTypeNoLabel toggleBaseType:ToggleBaseTypeDefault toggleButtonType:ToggleButtonTypeChangeImage];
    toggleViewButtonChange.toggleDelegate = self;
    
    [self.view addSubview:toggleViewWithLabel];
    [self.view addSubview:toggleViewWithoutLabel];
    [self.view addSubview:toggleViewBaseChange];
    [self.view addSubview:toggleViewButtonChange];
    
    /*label*/
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(60, 40, 200, 15)];
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(60, 140, 200, 15)];
	UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(60, 240, 200, 15)];
    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(60, 340, 200, 15)];
    label1.text = @"Toggle with label.";
    label2.text = @"Toggle without label.";
    label3.text = @"Toggle base image change.";
    label4.text = @"Toggle button image change.";
    label1.backgroundColor = [UIColor clearColor];
    label2.backgroundColor = [UIColor clearColor];
    label3.backgroundColor = [UIColor clearColor];
    label4.backgroundColor = [UIColor clearColor];
    label1.font = [UIFont boldSystemFontOfSize:14];
    label2.font = [UIFont boldSystemFontOfSize:14];
    label3.font = [UIFont boldSystemFontOfSize:14];
    label4.font = [UIFont boldSystemFontOfSize:14];
    label1.alpha = 0.7f;
    label2.alpha = 0.7f;
    label3.alpha = 0.7f;
    label4.alpha = 0.7f;
    label1.textAlignment = 1;
    label2.textAlignment = 1;
    label3.textAlignment = 1;
    label4.textAlignment = 1;
    
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    [self.view addSubview:label3];
    [self.view addSubview:label4];
    
    [toggleViewBaseChange setSelectedButton:ToggleButtonSelectedRight];
    [toggleViewButtonChange setSelectedButton:ToggleButtonSelectedRight];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - ToggleViewDelegate

- (void)selectLeftButton
{
    NSLog(@"LeftButton Selected");
}

- (void)selectRightButton
{
    NSLog(@"RightButton Selected");
}

@end
