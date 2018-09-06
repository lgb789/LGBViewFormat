//
//  LGBBorderExample.m
//  LGBViewFormat
//
//  Created by mac_256 on 2018/9/6.
//Copyright © 2018年 lgb789. All rights reserved.
//

#import "LGBBorderExample.h"

@interface LGBBorderExample ()

@end

@implementation LGBBorderExample

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
    
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
    
    [self.view addSubview:v1];
    
    v1.lgb_format
    .backgroundColor(UIColor.blackColor)
    .leftBorder(UIColor.redColor, 2)
    .topBorder(UIColor.greenColor, 2)
    .rightBorder(UIColor.yellowColor, 2)
    .bottomBorder(UIColor.orangeColor, 2);
    
    
}
#pragma mark ------------------------------------------------- delegate -------------------------------------------------

#pragma mark ------------------------------------------------- event -------------------------------------------------

#pragma mark ------------------------------------------------- property -------------------------------------------------

@end
