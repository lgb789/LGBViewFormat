//
//  UIButton+imageposition.m
//  ViewFormat
//
//  Created by mac_256 on 2018/9/5.
//  Copyright © 2018年 mac_256. All rights reserved.
//

#import "UIButton+imageposition.h"
#import <objc/runtime.h>

@implementation UIButton (imageposition)
+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getInstanceMethod([self class], @selector(layoutSubviews));
        Method replacementMethod = class_getInstanceMethod([self class], @selector(bt_layoutSubviews));
        method_exchangeImplementations(originalMethod, replacementMethod);
    });
}

-(void)bt_layoutSubviews
{
    [self bt_layoutSubviews];
    
    id position = [self bt_position];
    if (position) {
        [self bt_updateFrameWithPosition:[position integerValue] padding:[[self bt_padding] floatValue]];
    }
}

-(void)bt_setImagePosition:(LGBButtonImagePosition)position andImageTitlePadding:(CGFloat)padding
{
    objc_setAssociatedObject(self, @selector(bt_position), @(position), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, @selector(bt_padding), @(padding), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(id)bt_position
{
    return objc_getAssociatedObject(self, _cmd);
}

-(id)bt_padding
{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)bt_updateFrameWithPosition:(LGBButtonImagePosition)position padding:(CGFloat)padding
{
    if (position == LGBButtonImagePositionTop) {
        
        self.titleEdgeInsets = UIEdgeInsetsMake(CGRectGetHeight(self.imageView.bounds) + CGRectGetHeight(self.titleLabel.bounds) + padding, -CGRectGetWidth(self.imageView.bounds), 0, 0);
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -CGRectGetWidth(self.titleLabel.bounds));
        
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 0, CGRectGetHeight(self.titleLabel.bounds) + padding / 2, 0);
        
    }else if (position == LGBButtonImagePositionLeft){
        
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -padding);
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, padding / 2);
        
    }else if (position == LGBButtonImagePositionBottom){
        
        self.titleEdgeInsets = UIEdgeInsetsMake(0, -CGRectGetWidth(self.imageView.bounds), CGRectGetHeight(self.imageView.bounds) + CGRectGetHeight(self.titleLabel.bounds) + padding, 0);
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -CGRectGetWidth(self.titleLabel.bounds));
        
        self.contentEdgeInsets = UIEdgeInsetsMake(CGRectGetHeight(self.titleLabel.bounds) + padding / 2, 0, 0, 0);
    }else if (position == LGBButtonImagePositionRight){
        
        self.titleEdgeInsets = UIEdgeInsetsMake(0, -(CGRectGetWidth(self.imageView.bounds) * 2), 0, 0);
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -(CGRectGetWidth(self.titleLabel.bounds) * 2 + padding));
        
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, padding / 2);
        
    }
}
@end
