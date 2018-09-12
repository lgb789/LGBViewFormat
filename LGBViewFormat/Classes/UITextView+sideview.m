//
//  UITextView+sideview.m
//  LGBViewFormat_Example
//
//  Created by mac_256 on 2018/9/11.
//  Copyright © 2018年 lgb789. All rights reserved.
//

#import "UITextView+sideview.h"

@implementation UITextView (sideview)
-(void)lgb_setsideView:(UIView *)sideView position:(LGBTextViewSideViewPosition)position padding:(CGFloat)padding
{
    if (!sideView) {
        return;
    }
    
    switch (position) {
        case LGBTextViewSideViewPositionTopLeft:
            [self lgb_setLeftSideView:sideView padding:padding];
            break;
        case LGBTextViewSideViewPositionTopRight:
            [self lgb_setRightSideView:sideView padding:padding];
            break;
            
        default:
            break;
    }
    
}

-(void)lgb_setLeftSideView:(UIView *)sideView padding:(CGFloat)padding
{
    UIView *superView = [self lgb_superView];
    
    [superView addSubview:sideView];
    
    sideView.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIEdgeInsets insets = self.textContainerInset;
    
    NSLayoutConstraint *xConstrain = [NSLayoutConstraint constraintWithItem:sideView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:CGRectGetMinX(sideView.frame)];
    
    NSLayoutConstraint *yConstrain = [NSLayoutConstraint constraintWithItem:sideView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:CGRectGetMinY(sideView.frame)];
    
    NSLayoutConstraint *widthConstrain = [NSLayoutConstraint constraintWithItem:sideView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:0 constant:CGRectGetWidth(sideView.bounds)];
    
    NSLayoutConstraint *heightConstrain = [NSLayoutConstraint constraintWithItem:sideView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:0 constant:CGRectGetHeight(sideView.bounds)];
    
    self.textContainerInset = UIEdgeInsetsMake(0, CGRectGetMaxX(sideView.frame) + padding, 0, insets.right);
    
    [superView addConstraints:@[xConstrain, yConstrain, widthConstrain, heightConstrain]];
}

-(void)lgb_setRightSideView:(UIView *)sideView padding:(CGFloat)padding
{
    UIView *superView = [self lgb_superView];
    
    [superView addSubview:sideView];
    
    sideView.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIEdgeInsets insets = self.textContainerInset;
    
    NSLayoutConstraint *xConstrain = [NSLayoutConstraint constraintWithItem:sideView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:CGRectGetMinX(sideView.frame)];
    
    NSLayoutConstraint *yConstrain = [NSLayoutConstraint constraintWithItem:sideView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:CGRectGetMinY(sideView.frame)];
    
    NSLayoutConstraint *widthConstrain = [NSLayoutConstraint constraintWithItem:sideView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:0 constant:CGRectGetWidth(sideView.bounds)];
    
    NSLayoutConstraint *heightConstrain = [NSLayoutConstraint constraintWithItem:sideView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:0 constant:CGRectGetHeight(sideView.bounds)];
    
    self.textContainerInset = UIEdgeInsetsMake(0, insets.left, 0, CGRectGetWidth(sideView.bounds) + padding);
    
    [superView addConstraints:@[xConstrain, yConstrain, widthConstrain, heightConstrain]];
}

-(UIView *)lgb_superView
{
    UIView *superView = self;
    while (superView.superview) {
        superView = superView.superview;
    }
    
    return superView;
}

@end
