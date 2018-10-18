//
//  LGBUISegmentedControlController.m
//  LGBViewFormat
//
//  Created by mac_256 on 2018/9/14.
//Copyright © 2018年 lgb789. All rights reserved.
//

#import "LGBUISegmentedControlController.h"
#import "UIImage+lgb_image.h"
//#import "UISegmentedControl+underline.h"

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
    [self.view addSubview:control];
    
    control.lgb_format
//    .backgroundImageForState([UIImage lgb_imageWithColor:UIColor.whiteColor], UIControlStateNormal)
//    .backgroundImageForState([UIImage lgb_imageWithColor:UIColor.whiteColor], UIControlStateSelected)
//    .titleColorForState(UIColor.blueColor, UIControlStateSelected)
//    .titleColorForState(UIColor.blueColor, UIControlStateNormal)
//    .titleFontForState([UIFont systemFontOfSize:18], UIControlStateNormal)
//    .dividerImageForState([UIImage lgb_imageWithColor:UIColor.whiteColor], UIControlStateNormal);
//    .dividerImageForState([UIImage lgb_imageWithColor:UIColor.whiteColor], UIControlStateSelected);
    .segmentedTitleColorForStates(UIColor.blueColor, @[@(UIControlStateNormal), @(UIControlStateSelected)])
    .segmentedTitleFontForStates([UIFont systemFontOfSize:18], @[@(UIControlStateNormal), @(UIControlStateSelected)])
    .segmentedDividerImageForStates([UIImage lgb_imageWithColor:UIColor.whiteColor], @[@(UIControlStateNormal), @(UIControlStateSelected)])
    .segmentedBackgroundImageForStates([UIImage lgb_imageWithColor:UIColor.whiteColor], @[@(UIControlStateNormal), @(UIControlStateSelected)])
    .segmentedAddUnderLine(UIColor.redColor, 2, 0.8);
    
    
    
    
//    [control v_addUnderLineColor:UIColor.redColor lineHeight:2.0 lineWidthScale:0.8];
    
    [control addTarget:self action:@selector(handleSegmentedChange:) forControlEvents:UIControlEventValueChanged];
    
}
#pragma mark ------------------------------------------------- delegate -------------------------------------------------

#pragma mark ------------------------------------------------- event -------------------------------------------------
-(void)handleSegmentedChange:(UISegmentedControl *)segmentdControl
{
//    ZA_logObj(segmentdControl);
//    ZA_logInteger(segmentdControl.selectedSegmentIndex);
    
//    [segmentdControl v_changeUnderLinePositionWithAnimationDuration:0.3];
    segmentdControl.lgb_format
    .segmentedMoveUnderLine(0.3);
}
#pragma mark ------------------------------------------------- property -------------------------------------------------

@end
