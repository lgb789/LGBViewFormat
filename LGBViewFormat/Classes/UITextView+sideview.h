//
//  UITextView+sideview.h
//  LGBViewFormat_Example
//
//  Created by mac_256 on 2018/9/11.
//  Copyright © 2018年 lgb789. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LGBTextViewSideViewPositionTopLeft,
    LGBTextViewSideViewPositionTopRight,

} LGBTextViewSideViewPosition;

@interface UITextView (sideview)

-(void)lgb_setsideView:(UIView *)sideView position:(LGBTextViewSideViewPosition)position padding:(CGFloat)padding;

@end
