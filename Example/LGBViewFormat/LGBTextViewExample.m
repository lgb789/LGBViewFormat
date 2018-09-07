//
//  LGBTextViewExample.m
//  LGBViewFormat
//
//  Created by mac_256 on 2018/9/6.
//Copyright © 2018年 lgb789. All rights reserved.
//

#import "LGBTextViewExample.h"

@interface LGBTextViewExample ()
@property (nonatomic, strong) UITextView *tv;
@end

@implementation LGBTextViewExample

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
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"change" style:UIBarButtonItemStylePlain target:self action:@selector(handleTapChange)];
    
    UITextView *tv1 = [[UITextView alloc] initWithFrame:CGRectMake(15, 100, 280, 250)];
    [self.view addSubview:tv1];
    
    tv1.lgb_format
    .backgroundColor(UIColor.lightGrayColor)
    .font([UIFont systemFontOfSize:14.0])
    .textColor(UIColor.purpleColor)
    .text(@"Default UILabel line height not really good for my point of view, it’s to tight. Here is most simple way to change it in Swift.")
    
//    .textAlignment(NSTextAlignmentRight)
    .lineSpace(15)
    .firstLineHeadIndent(15);
    
    self.tv = tv1;
    
    
    UITextView *tv2 = [[UITextView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(tv1.frame) + 15, 280, 150)];
    
    [self.view addSubview:tv2];
    
    tv2.lgb_format
    .backgroundColor(UIColor.lightGrayColor)
    .font([UIFont systemFontOfSize:14.0])
    .textColor(UIColor.purpleColor)
    .text(@"Default UILabel line height not really good for my point of view, it’s to tight. I think it’s looks better when increased a little and added more white space between lines. Here is most simple way to change it in Swift.it’s to tight. I think it’s looks better when increased a little and added more white space between lines. Here is most simple way to change it in Swiftit’s to tight. I think it’s looks better when increased a little and added more white space between lines. Here is most simple way to change it in Swift")
//    .textContainerInset(UIEdgeInsetsMake(10, 15, 15, 10))
    .textColorForString(UIColor.redColor, @"UILabel")
    .underlineForString(NSUnderlineStyleSingle, UIColor.greenColor, @"Swift")
    .leftBorder(UIColor.purpleColor, 5)
    .fontForString([UIFont systemFontOfSize:20], @"good")
    .backgroundColorForString(UIColor.yellowColor, @"it’s to tight")
    .strikethroughForString(1, UIColor.redColor, @"more white space");
    
    tv2.scrollEnabled = YES;
}
#pragma mark ------------------------------------------------- delegate -------------------------------------------------

#pragma mark ------------------------------------------------- event -------------------------------------------------
-(void)handleTapChange
{
    self.tv.text = @"Default UILabel line height not really good for my point of view, it’s to tight.";
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
#pragma mark ------------------------------------------------- property -------------------------------------------------

@end
