//
//  UIView+border.h
//  ViewFormat
//
//  Created by mac_256 on 2018/9/5.
//  Copyright © 2018年 mac_256. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LGBViewBorderPositionTop,
    LGBViewBorderPositionLeft,
    LGBViewBorderPositionBottom,
    LGBViewBorderPositionRight
} LGBViewBorderPosition;

@interface UIView (border)

-(void)v_setBorderPosition:(LGBViewBorderPosition)position borderColor:(UIColor *)borderColor borderSize:(CGFloat)borderSize;

@end
