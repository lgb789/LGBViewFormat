//
//  LGBButtonExample.m
//  LGBViewFormat
//
//  Created by mac_256 on 2018/9/6.
//Copyright © 2018年 lgb789. All rights reserved.
//

#import "LGBButtonExample.h"

@interface LGBButtonExample ()

@end

@implementation LGBButtonExample

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
    
    UIButton *bt1 = [UIButton buttonWithType:UIButtonTypeCustom];
    bt1.frame = CGRectMake(20, 100, 80, 40);
    
    bt1.lgb_format
    .titleForState(@"Hello", UIControlStateNormal)
    .titleColorForState(UIColor.orangeColor, UIControlStateNormal)
    .titleFont([UIFont systemFontOfSize:14.0])
    .backgroundColor(UIColor.blueColor);
    
    [self.view addSubview:bt1];
    
    UIButton *bt2 = [UIButton buttonWithType:UIButtonTypeCustom];
    bt2.frame = CGRectMake(20, CGRectGetMaxY(bt1.frame) + 15, 80, 30);
    
    bt2.lgb_format
    .titleForState(@"Login", UIControlStateNormal)
    .titleColorForState(UIColor.orangeColor, UIControlStateNormal)
    .titleFont([UIFont systemFontOfSize:14.0])
    .backgroundImageForState([UIImage imageNamed:@"login_button_bg"], UIControlStateNormal);
    
    [self.view addSubview:bt2];
    
    UIButton *bt3 = [UIButton buttonWithType:UIButtonTypeCustom];
    bt3.frame = CGRectMake(20, CGRectGetMaxY(bt2.frame) + 15, 80, 30);
    
    bt3.lgb_format
    .titleForState(@"Box", UIControlStateNormal)
    .titleFont([UIFont systemFontOfSize:14.0])
    .titleColorForState(UIColor.greenColor, UIControlStateNormal)
    .imageForState([UIImage imageNamed:@"login_uncheck_box"], UIControlStateNormal)
    .imageForState([UIImage imageNamed:@"login_check_box"], UIControlStateHighlighted)
    .imagePosition(LGBButtonImagePositionLeft, 10);
    
    [self.view addSubview:bt3];
    
    UIButton *bt4 = [UIButton buttonWithType:UIButtonTypeCustom];
    bt4.frame = CGRectMake(20, CGRectGetMaxY(bt3.frame) + 15, 80, 100);
    
    bt4.lgb_format
    .titleForState(@"Func", UIControlStateNormal)
    .titleFont([UIFont systemFontOfSize:14.0])
    .titleColorForState(UIColor.blackColor, UIControlStateNormal)
    .imageForState([UIImage imageNamed:@"icon_func_annual_audit"], UIControlStateNormal)
    .imagePosition(LGBButtonImagePositionTop, 10)
    .adjustsImageWhenHighlighted(NO);
    
    [self.view addSubview:bt4];
}
#pragma mark ------------------------------------------------- delegate -------------------------------------------------

#pragma mark ------------------------------------------------- event -------------------------------------------------

#pragma mark ------------------------------------------------- property -------------------------------------------------

@end
