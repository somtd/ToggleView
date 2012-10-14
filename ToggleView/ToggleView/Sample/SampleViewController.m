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
@synthesize toggleView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    toggleView = [[ToggleView alloc]initWithFrame:CGRectMake(0, 100, 320, 75)];
    [self.view addSubview:toggleView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
