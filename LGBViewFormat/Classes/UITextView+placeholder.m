//
//  UITextView+placeholder.m
//  LGBViewFormat_Example
//
//  Created by mac_256 on 2018/9/13.
//  Copyright © 2018年 lgb789. All rights reserved.
//

#import "UITextView+placeholder.h"
#import <objc/runtime.h>

@implementation UITextView (placeholder)

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)lgb_setPlaceholder:(NSString *)placeholder placeholderColor:(UIColor *)placeholderColor text:(NSString *)text textColor:(UIColor *)textColor
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(lgb_beginEdit:) name:UITextViewTextDidBeginEditingNotification object:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(lgb_endEdit:) name:UITextViewTextDidEndEditingNotification object:self];
    
    [self lgb_setPlaceholder:placeholder];
    [self lgb_setPlaceholderColor:placeholderColor];
    [self lgb_setTextColor:textColor];
    
    if (text && text.length) {
        self.text = text;
        self.textColor = textColor;
    }else{
        self.text = placeholder;
        self.textColor = placeholderColor;
    }
}

#pragma mark - event
-(void)lgb_beginEdit:(NSNotification *)notification
{
    if ([self.text isEqualToString:[self lgb_placeholder]]) {
        self.text = @"";
    }
    
    self.textColor = [self lgb_textColor];
}

-(void)lgb_endEdit:(NSNotification *)notification
{
    if (self.text.length == 0) {
        self.text = [self lgb_placeholder];
        self.textColor = [self lgb_placeholderColor];
    }
}


#pragma mark - properties
-(NSString *)lgb_placeholder
{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)lgb_setPlaceholder:(NSString *)placeholder
{
    objc_setAssociatedObject(self, @selector(lgb_placeholder), placeholder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIColor *)lgb_placeholderColor
{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)lgb_setPlaceholderColor:(UIColor *)color
{
    objc_setAssociatedObject(self, @selector(lgb_placeholderColor), color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIColor *)lgb_textColor
{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)lgb_setTextColor:(UIColor *)color
{
    objc_setAssociatedObject(self, @selector(lgb_textColor), color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
