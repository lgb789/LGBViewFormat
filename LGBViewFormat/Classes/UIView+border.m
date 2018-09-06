//
//  UIView+border.m
//  ViewFormat
//
//  Created by mac_256 on 2018/9/5.
//  Copyright © 2018年 mac_256. All rights reserved.
//

#import "UIView+border.h"

@implementation UIView (border)

-(void)v_setBorderPosition:(LGBViewBorderPosition)position borderColor:(UIColor *)borderColor borderSize:(CGFloat)borderSize
{
    switch (position) {
        case LGBViewBorderPositionTop:
            [self v_setTopBorderColor:borderColor borderSize:borderSize];
            break;
        case LGBViewBorderPositionLeft:
            [self v_setLeftBorderColor:borderColor borderSize:borderSize];
            break;
        case LGBViewBorderPositionBottom:
            [self v_setBottomBorderColor:borderColor borderSize:borderSize];
            break;
        case LGBViewBorderPositionRight:
            [self v_setRightBorderColor:borderColor borderSize:borderSize];
            break;
            
        default:
            break;
    }
}

-(void)v_setBottomBorderColor:(UIColor *)borderColor borderSize:(CGFloat)borderSize
{
    UIView *superView = [self v_superView];
    
    UIView *line = [UIView new];
    line.backgroundColor = borderColor;
    line.translatesAutoresizingMaskIntoConstraints = NO;
    [superView addSubview:line];

    NSLayoutConstraint *xConstraint = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    NSLayoutConstraint *yConstraint = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:0 constant:borderSize];
    
    [superView addConstraints:@[widthConstraint, xConstraint, yConstraint, heightConstraint]];
}

-(void)v_setTopBorderColor:(UIColor *)borderColor borderSize:(CGFloat)borderSize
{
    UIView *superView = [self v_superView];
    
    UIView *line = [UIView new];
    line.backgroundColor = borderColor;
    line.translatesAutoresizingMaskIntoConstraints = NO;
    [superView addSubview:line];
    
    NSLayoutConstraint *xConstraint = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    NSLayoutConstraint *yConstraint = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:0 constant:borderSize];
    
    [superView addConstraints:@[widthConstraint, xConstraint, yConstraint, heightConstraint]];
}

-(void)v_setLeftBorderColor:(UIColor *)borderColor borderSize:(CGFloat)borderSize
{
    UIView *superView = [self v_superView];
    
    UIView *line = [UIView new];
    line.backgroundColor = borderColor;
    line.translatesAutoresizingMaskIntoConstraints = NO;
    [superView addSubview:line];
    
    NSLayoutConstraint *xConstraint = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    NSLayoutConstraint *yConstraint = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:0 constant:borderSize];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    
    [superView addConstraints:@[widthConstraint, xConstraint, yConstraint, heightConstraint]];
}

-(void)v_setRightBorderColor:(UIColor *)borderColor borderSize:(CGFloat)borderSize
{
    UIView *superView = [self v_superView];
    
    UIView *line = [UIView new];
    line.backgroundColor = borderColor;
    line.translatesAutoresizingMaskIntoConstraints = NO;
    [superView addSubview:line];
    
    NSLayoutConstraint *xConstraint = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    
    NSLayoutConstraint *yConstraint = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:0 constant:borderSize];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    
    [superView addConstraints:@[widthConstraint, xConstraint, yConstraint, heightConstraint]];
}

-(UIView *)v_superView
{
    UIView *superView = self;
    while (superView.superview) {
        superView = superView.superview;
    }
    return superView;
}
@end
