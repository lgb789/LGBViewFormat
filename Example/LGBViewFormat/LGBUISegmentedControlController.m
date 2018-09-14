//
//  LGBUISegmentedControlController.m
//  LGBViewFormat
//
//  Created by mac_256 on 2018/9/14.
//Copyright © 2018年 lgb789. All rights reserved.
//

#import "LGBUISegmentedControlController.h"
#import "UIImage+lgb_image.h"

@interface LGBUISegmentedControlController ()

@end

@implementation LGBUISegmentedControlController

#pragma mark ------------------------------------------------- lifecycle ------------------------------------------------

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    [self setupViews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

#pragma mark ------------------------------------------------- public -------------------------------------------------

#pragma mark ------------------------------------------------- private -------------------------------------------------
-(void)setupViews
{
    self.view.backgroundColor = UIColor.whiteColor;
    
    UISegmentedControl *control = [[UISegmentedControl alloc] initWithItems:@[@"名称", @"值", @"范围"]];
    control.frame = CGRectMake(20, 70, 280, 50);
    
    control.lgb_format
    .backgroundImageForState([UIImage lgb_imageWithColor:UIColor.whiteColor], UIControlStateNormal)
    .backgroundImageForState([UIImage lgb_imageWithColor:UIColor.whiteColor], UIControlStateSelected)
    .titleColorForState(UIColor.blueColor, UIControlStateSelected)
    .titleColorForState(UIColor.blueColor, UIControlStateNormal)
    .titleFontForState([UIFont systemFontOfSize:18], UIControlStateNormal)
    .dividerImageForState([UIImage lgb_imageWithColor:UIColor.whiteColor], UIControlStateNormal)
    .dividerImageForState([UIImage lgb_imageWithColor:UIColor.whiteColor], UIControlStateSelected);
    
    [self.view addSubview:control];
    
}
#pragma mark ------------------------------------------------- delegate -------------------------------------------------

#pragma mark ------------------------------------------------- event -------------------------------------------------

#pragma mark ------------------------------------------------- property -------------------------------------------------

@end
