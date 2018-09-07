//
//  UIView+LGBFormat.h
//  ViewFormat
//
//  Created by mac_256 on 2018/9/4.
//  Copyright © 2018年 mac_256. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+imageposition.h"
#import "UIView+border.h"

@class LGBFormatManager;

typedef LGBFormatManager* (^BFormatAttr)(id attr);
typedef LGBFormatManager* (^BFormatAlignAttr)(NSTextAlignment textAlignment);
typedef LGBFormatManager* (^BFormatIntegerAttr)(NSInteger attr);
typedef LGBFormatManager* (^BFormatBoolAttr)(BOOL attr);
typedef LGBFormatManager* (^BFormatTfPaddingAttr)(UIView *sideView, CGFloat padding,  UITextFieldViewMode mode);
typedef LGBFormatManager* (^BFormatControlAttr)(id attr, UIControlState state);
typedef LGBFormatManager* (^BFormatButtonImageAttr)(LGBButtonImagePosition position, CGFloat padding);
typedef LGBFormatManager* (^BFormatTvPaddingAttr)(UIEdgeInsets padding);
typedef LGBFormatManager* (^BFormatBorderAttr)(UIColor *color, CGFloat size);
typedef LGBFormatManager* (^BFormatMutableAttr)(id attr, NSString *str);
typedef LGBFormatManager* (^BFormatMutableUnderLineAttr)(NSInteger type, UIColor *color, NSString *str);
typedef LGBFormatManager* (^BFormatMutableSpaceAttr)(CGFloat space);


@interface LGBFormatManager : NSObject
@property (nonatomic, weak) id view;

@property (nonatomic, copy) BFormatAttr textColor;
@property (nonatomic, copy) BFormatAttr backgroundColor;

@property (nonatomic, copy) BFormatAttr font;

@property (nonatomic, copy) BFormatAttr text;
@property (nonatomic, copy) BFormatAttr placeholder;

@property (nonatomic, copy) BFormatAlignAttr textAlignment;
@property (nonatomic, copy) BFormatIntegerAttr numberOfLines;

@property (nonatomic, copy) BFormatBoolAttr adjustsFontSizeToFitWidth;

/**
 设置 UITextField leftView
 
 mode: leftView mode
 */
@property (nonatomic, copy) BFormatTfPaddingAttr leftView;

/**
 设置 UITextField rightView
 
 mode: right mode
 */
@property (nonatomic, copy) BFormatTfPaddingAttr rightView;

/**
 设置 UIImageView 图片
 */
@property (nonatomic, copy) BFormatAttr image;

/**
 设置 UIImageView 高亮图片
 */
@property (nonatomic, copy) BFormatAttr highlightedImage;

/**
 设置 UIButton 标题
 */
@property (nonatomic, copy) BFormatControlAttr titleForState;

/**
 设置 UIButton 标题颜色
 */
@property (nonatomic, copy) BFormatControlAttr titleColorForState;

/**
 设置 UIButton 标题字体
 */
@property (nonatomic, copy) BFormatAttr titleFont;

/**
 设置 UIButton 图片
 */
@property (nonatomic, copy) BFormatControlAttr imageForState;

/**
 设置 UIButton 背景图片
 */
@property (nonatomic, copy) BFormatControlAttr backgroundImageForState;

/**
 设置 UIButton Image 位置
 */
@property (nonatomic, copy) BFormatButtonImageAttr imagePosition;

@property (nonatomic, copy) BFormatBoolAttr adjustsImageWhenHighlighted;

@property (nonatomic, copy) BFormatBoolAttr adjustsImageWhenDisabled;

@property (nonatomic, copy) BFormatBoolAttr editable;

/**
 设置 UITextView text 边距
 */
@property (nonatomic, copy) BFormatTvPaddingAttr textContainerInset;

@property (nonatomic, copy) BFormatBorderAttr topBorder;
@property (nonatomic, copy) BFormatBorderAttr leftBorder;
@property (nonatomic, copy) BFormatBorderAttr bottomBorder;
@property (nonatomic, copy) BFormatBorderAttr rightBorder;

/**
 设置字符串颜色，当前 View 需要具备 attributedText 属性
 */
@property (nonatomic, copy) BFormatMutableAttr textColorForString;

/**
 设置字符串字体，当前 View 需要具备 attributedText 属性
 */
@property (nonatomic, copy) BFormatMutableAttr fontForString;

/**
 设置字符串背景色，当前 View 需要具备 attributedText 属性
 */
@property (nonatomic, copy) BFormatMutableAttr backgroundColorForString;

/**
 设置字符串删除线，当前 View 需要具备 attributedText 属性
 
 type: 1~7单线,依次加粗; 9~15:双线,依次加粗
 */
@property (nonatomic, copy) BFormatMutableUnderLineAttr strikethroughForString;

/**
 设置字符串下划线，当前 View 需要具备 attributedText 属性
 
 type: 1~7单线,依次加粗; 9~15:双线,依次加粗
 */
@property (nonatomic, copy) BFormatMutableUnderLineAttr underlineForString;

/**
 设置行间距，当前 View 需要具备 attributedText 属性
 */
@property (nonatomic, copy) BFormatMutableSpaceAttr lineSpace;

/**
 设置首行缩进，如果有 lineSpace 则必须在其后，否则 lineSpace 没有修改，还不知道原因，当前 View 需要具备 attributedText 属性
 */
@property (nonatomic, copy) BFormatMutableSpaceAttr firstLineHeadIndent;

@property (nonatomic, copy) BFormatBoolAttr userInteractionEnabled;

/**
 UITextFieldViewMode
 */
@property (nonatomic, copy) BFormatIntegerAttr clearButtonMode;

@property (nonatomic, copy) BFormatBoolAttr scrollEnabled;
@end

@interface UIView (LGBFormat)
-(LGBFormatManager *)lgb_format;
@end
