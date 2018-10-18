//
//  UISegmentedControl+underline.h
//  LGBViewFormat_Example
//
//  Created by mac_256 on 2018/10/16.
//  Copyright © 2018 lgb789. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UISegmentedControl (underline)

-(void)v_addUnderLineColor:(UIColor *)lineColor lineHeight:(CGFloat)lineHeight lineWidthScale:(CGFloat)lineWidthScale;

-(void)v_changeUnderLinePositionWithAnimationDuration:(CGFloat)animationDuration;

@end

NS_ASSUME_NONNULL_END
