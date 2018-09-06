//
//  UIButton+imageposition.h
//  ViewFormat
//
//  Created by mac_256 on 2018/9/5.
//  Copyright © 2018年 mac_256. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LGBButtonImagePositionTop,
    LGBButtonImagePositionLeft,
    LGBButtonImagePositionBottom,
    LGBButtonImagePositionRight
} LGBButtonImagePosition;

@interface UIButton (imageposition)

-(void)bt_setImagePosition:(LGBButtonImagePosition)position andImageTitlePadding:(CGFloat)padding;

@end
