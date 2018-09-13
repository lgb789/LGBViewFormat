//
//  LGBTextViewPlaceHolderController.m
//  LGBViewFormat
//
//  Created by mac_256 on 2018/9/13.
//Copyright © 2018年 lgb789. All rights reserved.
//

#import "LGBTextViewPlaceHolderController.h"
//#import "UITextView+placeholder.h"

@interface LGBTextViewPlaceHolderController ()

@end

@implementation LGBTextViewPlaceHolderController

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
    
    UITextView *tv1 = [[UITextView alloc] initWithFrame:CGRectMake(10, 70, 250, 180)];
    
    tv1.lgb_format
//    .text(@" ")
    .textColor(UIColor.orangeColor)
    .font([UIFont systemFontOfSize:13.0])
//    .lineSpace(10)
    .backgroundColor(UIColor.lightGrayColor)
//    .text(@"")
    .textColorForString(UIColor.greenColor, @"string")
    .textViewPlaceholder(@"请输入内容", UIColor.purpleColor, @"", UIColor.redColor)
    .lineSpace(10);//需要设置文本后才生效

    
//    [tv1 lgb_setPlaceholder:@"请输入内容" placeholderColor:UIColor.purpleColor text:nil textColor:UIColor.orangeColor];
//    tv1.backgroundColor = UIColor.lightGrayColor;
    [self.view addSubview:tv1];
}
#pragma mark ------------------------------------------------- delegate -------------------------------------------------

#pragma mark ------------------------------------------------- event -------------------------------------------------
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
#pragma mark ------------------------------------------------- property -------------------------------------------------

@end
