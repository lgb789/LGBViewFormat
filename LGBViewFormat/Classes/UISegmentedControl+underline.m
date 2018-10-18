//
//  UISegmentedControl+underline.m
//  LGBViewFormat_Example
//
//  Created by mac_256 on 2018/10/16.
//  Copyright © 2018 lgb789. All rights reserved.
//

#import "UISegmentedControl+underline.h"
#import <objc/runtime.h>

const NSString *xContrainKey = @"xcontrainkey";

@implementation UISegmentedControl (underline)

-(void)v_addUnderLineColor:(UIColor *)lineColor lineHeight:(CGFloat)lineHeight lineWidthScale:(CGFloat)lineWidthScale
{
    if (self.selectedSegmentIndex == UISegmentedControlNoSegment) {
        self.selectedSegmentIndex = 0;
    }
    
    UIView *superView = [self v_superView];
    
    UIView *line = objc_getAssociatedObject(self, @selector(v_changeUnderLinePositionWithAnimationDuration:));
    [line removeFromSuperview];
    
    line = [UIView new];
    line.backgroundColor = lineColor;
    line.translatesAutoresizingMaskIntoConstraints = NO;
    
    [superView addSubview:line];
    
    NSLayoutConstraint *xConstraint = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:CGRectGetWidth(self.bounds)/self.numberOfSegments*self.selectedSegmentIndex];
    
    NSLayoutConstraint *yConstraint = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0/self.numberOfSegments constant:0];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:0 constant:lineHeight];
    
    [superView addConstraints:@[xConstraint, yConstraint, widthConstraint, heightConstraint]];
    
    objc_setAssociatedObject(self, @selector(v_changeUnderLinePositionWithAnimationDuration:), line, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    objc_setAssociatedObject(self, &xContrainKey, xConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    line.transform = CGAffineTransformMakeScale(lineWidthScale, 1.0);
}

-(void)v_changeUnderLinePositionWithAnimationDuration:(CGFloat)animationDuration
{
    UIView *line = objc_getAssociatedObject(self, _cmd);
    UIView *superView = [line superview];

    NSLayoutConstraint *xConstraint = objc_getAssociatedObject(self, &xContrainKey);
    xConstraint.constant = CGRectGetWidth(self.bounds)/self.numberOfSegments*self.selectedSegmentIndex;
    
    [UIView animateWithDuration:animationDuration animations:^{
        
        [superView layoutIfNeeded];
    }];

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
