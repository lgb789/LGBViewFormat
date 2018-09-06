//
//  LGBLableExample.m
//  LGBViewFormat
//
//  Created by mac_256 on 2018/9/6.
//Copyright © 2018年 lgb789. All rights reserved.
//

#import "LGBLableExample.h"

@interface LGBLableExample ()

@end

@implementation LGBLableExample

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
    
    UILabel *lb1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 200, 40)];
    
    lb1.lgb_format
    .backgroundColor(UIColor.lightGrayColor)
    .text(@"Hello world")
    .textColor(UIColor.redColor)
    .font([UIFont systemFontOfSize:13.0])
    .textAlignment(NSTextAlignmentCenter);
    
    [self.view addSubview:lb1];
    
    UILabel *lb2 = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(lb1.frame) + 20, 200, 100)];
    
    lb2.lgb_format
    .backgroundColor(UIColor.lightGrayColor)
    .text(@"Hello world\nI love you")
    .textColor(UIColor.redColor)
    .font([UIFont systemFontOfSize:13.0])
    .numberOfLines(0)
    .textColorForString(UIColor.greenColor, @"love")
    .fontForString([UIFont systemFontOfSize:18.0], @"you")
    .underlineForString(NSUnderlineStyleSingle, UIColor.purpleColor, @"orld")
    .lineSpace(20)
    .textAlignment(NSTextAlignmentCenter);
    
    [self.view addSubview:lb2];
    
    UILabel *lb3 = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(lb2.frame) + 20, 40, 50)];
    
    lb3.lgb_format
    .backgroundColor(UIColor.lightGrayColor)
    .text(@"Hello world I love you")
    .textColor(UIColor.redColor)
    .font([UIFont systemFontOfSize:23.0])
    .adjustsFontSizeToFitWidth(YES);
    
    [self.view addSubview:lb3];
}
#pragma mark ------------------------------------------------- delegate -------------------------------------------------

#pragma mark ------------------------------------------------- event -------------------------------------------------

#pragma mark ------------------------------------------------- property -------------------------------------------------

@end
