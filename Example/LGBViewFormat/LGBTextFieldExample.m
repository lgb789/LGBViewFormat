//
//  LGBTextFieldExample.m
//  LGBViewFormat
//
//  Created by mac_256 on 2018/9/6.
//Copyright © 2018年 lgb789. All rights reserved.
//

#import "LGBTextFieldExample.h"

@interface LGBTextFieldExample ()

@end

@implementation LGBTextFieldExample

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
    
    UITextField *tf1 = [[UITextField alloc] initWithFrame:CGRectMake(30, 100, 200, 40)];
    [self.view addSubview:tf1];
    
    tf1.lgb_format
    .placeholder(@"用户名")
    .textColor(UIColor.redColor)
    .font([UIFont systemFontOfSize:14.0])
    .bottomBorder(UIColor.blueColor, 1)
    .clearButtonMode(UITextFieldViewModeWhileEditing);

    UITextField *tf2 = [[UITextField alloc] initWithFrame:CGRectMake(30, CGRectGetMaxY(tf1.frame) + 15, 200, 40)];
    [self.view addSubview:tf2];
    
    tf2.lgb_format
    .placeholder(@"密码")
    .textColor(UIColor.redColor)
    .font([UIFont systemFontOfSize:14.0])
    .bottomBorder(UIColor.blueColor, 1)
    .clearButtonMode(UITextFieldViewModeWhileEditing)
    .leftView([UIView new], 15, UITextFieldViewModeAlways);
    
    UITextField *tf3 = [[UITextField alloc] initWithFrame:CGRectMake(30, CGRectGetMaxY(tf2.frame) + 15, 200, 40)];
    [self.view addSubview:tf3];
    
    UIImageView *leftView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 13, 13)];
    leftView.image = [UIImage imageNamed:@"login_pwd_icon"];
    
    tf3.lgb_format
    .placeholder(@"密码")
    .textColor(UIColor.redColor)
    .font([UIFont systemFontOfSize:14.0])
    .bottomBorder(UIColor.blueColor, 1)
    .clearButtonMode(UITextFieldViewModeWhileEditing)
    .leftView(leftView, 5, UITextFieldViewModeAlways);
    
    UITextField *tf4 = [[UITextField alloc] initWithFrame:CGRectMake(30, CGRectGetMaxY(tf3.frame) + 15, 200, 40)];
    [self.view addSubview:tf4];
    
    UIImageView *rightView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 13, 13)];
    rightView.image = [UIImage imageNamed:@"login_pwd_icon"];
    
    tf4.lgb_format
    .placeholder(@"密码")
    .textColor(UIColor.redColor)
    .font([UIFont systemFontOfSize:14.0])
    .bottomBorder(UIColor.blueColor, 1)
    .clearButtonMode(UITextFieldViewModeWhileEditing)
    .rightView(rightView, 5, UITextFieldViewModeAlways)
    .textAlignment(NSTextAlignmentRight);
    
    
    
}
#pragma mark ------------------------------------------------- delegate -------------------------------------------------

#pragma mark ------------------------------------------------- event -------------------------------------------------
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
#pragma mark ------------------------------------------------- property -------------------------------------------------

@end
