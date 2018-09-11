//
//  UIView+LGBFormat.m
//  ViewFormat
//
//  Created by mac_256 on 2018/9/4.
//  Copyright © 2018年 mac_256. All rights reserved.
//

#import "UIView+LGBFormat.h"
#import <objc/runtime.h>

@interface LGBFormatManager () <UITextFieldDelegate>
@property (nonatomic, strong) NSMutableParagraphStyle *paragraphStyle;
@end

@implementation LGBFormatManager

#pragma mark - public

-(BFormatAttr)textColor
{
    if (_textColor == nil) {
        _textColor = [self formatAttrForSel:@selector(textColor)];
    }
    return _textColor;
}

-(BFormatAttr)backgroundColor
{
    if (_backgroundColor == nil) {
        _backgroundColor = [self formatAttrForSel:@selector(backgroundColor)];
    }
    return _backgroundColor;
}

-(BFormatAttr)font
{
    if (_font == nil) {
        _font = [self formatAttrForSel:@selector(font)];
    }
    return _font;
}

-(BFormatAttr)text
{
    if (_text == nil) {
        _text = [self formatAttrForSel:@selector(text)];
    }
    return _text;
}

-(BFormatAttr)placeholder
{
    if (_placeholder == nil) {
        _placeholder = [self formatAttrForSel:@selector(placeholder)];
    }
    return _placeholder;
}

-(BFormatAlignAttr)textAlignment
{
    if (_textAlignment == nil) {
        __weak typeof(self) weakSelf = self;
        _textAlignment = ^(NSTextAlignment textAlignment){
            if ([weakSelf.view respondsToSelector:@selector(textAlignment)]) {
                [weakSelf.view setValue:@(textAlignment) forKey:NSStringFromSelector(@selector(textAlignment))];
                [weakSelf.paragraphStyle setAlignment:textAlignment];
            }
            return weakSelf;
        };
    }
    return _textAlignment;
}

-(BFormatIntegerAttr)numberOfLines
{
    if (_numberOfLines == nil) {
        __weak typeof(self) weakSelf = self;
        _numberOfLines = ^(NSInteger attr){
            if ([weakSelf.view respondsToSelector:@selector(numberOfLines)]) {
                [weakSelf.view setValue:@(attr) forKey:NSStringFromSelector(@selector(numberOfLines))];
            }
            return weakSelf;
        };
    }
    return _numberOfLines;
}

-(BFormatBoolAttr)adjustsFontSizeToFitWidth
{
    if (_adjustsFontSizeToFitWidth == nil) {
        __weak typeof(self) weakSelf = self;
        _adjustsFontSizeToFitWidth = ^(BOOL attr){
            if ([weakSelf.view respondsToSelector:@selector(adjustsFontSizeToFitWidth)]) {
                [weakSelf.view setValue:@(attr) forKey:NSStringFromSelector(@selector(adjustsFontSizeToFitWidth))];
            }
            return weakSelf;
        };
    }
    return _adjustsFontSizeToFitWidth;
}

-(BFormatTfPaddingAttr)leftView
{
    if (_leftView == nil) {
        __weak typeof(self) weakSelf = self;
        _leftView = ^(UIView *sideView, CGFloat padding,  UITextFieldViewMode mode){
            if ([weakSelf.view isKindOfClass:[UITextField class]]) {
                
                sideView.contentMode = UIViewContentModeLeft;
                CGRect frame = sideView.frame;
                frame.size.width = frame.size.width + padding;
                sideView.frame = frame;
                
                UITextField *tf = (UITextField *)weakSelf.view;
                tf.leftView = sideView;
                tf.leftViewMode = mode;
            }
            return weakSelf;
        };
    }
    return _leftView;
}

-(BFormatTfPaddingAttr)rightView
{
    if (_rightView == nil) {
        __weak typeof(self) weakSelf = self;
        _rightView = ^(UIView *sideView, CGFloat padding,  UITextFieldViewMode mode){
            if ([weakSelf.view isKindOfClass:[UITextField class]]) {
                
                sideView.contentMode = UIViewContentModeRight;
                CGRect frame = sideView.frame;
                frame.size.width = frame.size.width + padding;
                sideView.frame = frame;
                
                UITextField *tf = (UITextField *)weakSelf.view;
                tf.rightView = sideView;
                tf.rightViewMode = mode;
            }
            return weakSelf;
        };
    }
    return _rightView;
}

-(BFormatAttr)image
{
    if (_image == nil) {
        _image = [self formatAttrForSel:@selector(image)];
    }
    return _image;
}

-(BFormatAttr)highlightedImage
{
    if (_highlightedImage == nil) {
        _highlightedImage = [self formatAttrForSel:@selector(highlightedImage)];
    }
    return _highlightedImage;
}

-(BFormatControlAttr)titleForState
{
    if (_titleForState == nil) {
        __weak typeof(self) weakSelf = self;
        _titleForState = ^(id attr, UIControlState state){
            if ([weakSelf.view isKindOfClass:[UIButton class]]) {
                UIButton *bt = (UIButton *)weakSelf.view;
                [bt setTitle:attr forState:state];
            }
            return weakSelf;
        };
    }
    return _titleForState;
}

-(BFormatControlAttr)titleColorForState
{
    if (_titleColorForState == nil) {
        __weak typeof(self) weakSelf = self;
        _titleColorForState = ^(id attr, UIControlState state){
            if ([weakSelf.view isKindOfClass:[UIButton class]]) {
                UIButton *bt = (UIButton *)weakSelf.view;
                [bt setTitleColor:attr forState:state];
            }
            return weakSelf;
        };
    }
    return _titleColorForState;
}

-(BFormatAttr)titleFont
{
    if (_titleFont == nil) {
        __weak typeof(self) weakSelf = self;
        _titleFont = ^(id attr){
            if ([weakSelf.view isKindOfClass:[UIButton class]]) {
                UIButton *bt = (UIButton *)weakSelf.view;
                bt.titleLabel.font = attr;
            }
            return weakSelf;
        };
    }
    return _titleFont;
}

-(BFormatControlAttr)imageForState
{
    if (_imageForState == nil) {
        __weak typeof(self) weakSelf = self;
        _imageForState = ^(id attr, UIControlState state){
            if ([weakSelf.view isKindOfClass:[UIButton class]]) {
                UIButton *bt = (UIButton *)weakSelf.view;
                [bt setImage:attr forState:state];
            }
            return weakSelf;
        };
    }
    return _imageForState;
}

-(BFormatControlAttr)backgroundImageForState
{
    if (_backgroundImageForState == nil) {
        __weak typeof(self) weakSelf = self;
        _backgroundImageForState = ^(id attr, UIControlState state){
            if ([weakSelf.view isKindOfClass:[UIButton class]]) {
                UIButton *bt = (UIButton *)weakSelf.view;
                [bt setBackgroundImage:attr forState:state];
            }
            return weakSelf;
        };
    }
    return _backgroundImageForState;
}

-(BFormatButtonImageAttr)imagePosition
{
    if (_imagePosition == nil) {
        
        __weak typeof(self) weakSelf = self;
        _imagePosition = ^(LGBButtonImagePosition position, CGFloat padding){
            if ([weakSelf.view isKindOfClass:[UIButton class]]) {
                [(UIButton *)weakSelf.view bt_setImagePosition:position andImageTitlePadding:padding];
            }
            
            return weakSelf;
        };
        
    }
    return _imagePosition;
}

-(BFormatBoolAttr)adjustsImageWhenHighlighted
{
    if (_adjustsImageWhenHighlighted == nil) {
        __weak typeof(self) weakSelf = self;
        _adjustsImageWhenHighlighted = ^(BOOL attr){
            if ([weakSelf.view respondsToSelector:@selector(adjustsImageWhenHighlighted)]) {
                [weakSelf.view setValue:@(attr) forKey:NSStringFromSelector(@selector(adjustsImageWhenHighlighted))];
            }
            return weakSelf;
        };
    }
    return _adjustsImageWhenHighlighted;
}

-(BFormatBoolAttr)adjustsImageWhenDisabled
{
    if (_adjustsImageWhenDisabled == nil) {
        __weak typeof(self) weakSelf = self;
        _adjustsImageWhenDisabled = ^(BOOL attr){
            if ([weakSelf.view respondsToSelector:@selector(adjustsImageWhenDisabled)]) {
                [weakSelf.view setValue:@(attr) forKey:NSStringFromSelector(@selector(adjustsImageWhenDisabled))];
            }
            return weakSelf;
        };
    }
    return _adjustsImageWhenDisabled;
}

-(BFormatBoolAttr)editable
{
    if (_editable == nil) {
        __weak typeof(self) weakSelf = self;
        _editable = ^(BOOL attr){
            if ([weakSelf.view respondsToSelector:@selector(setEditable:)]) {
                [weakSelf.view setValue:@(attr) forKey:NSStringFromSelector(@selector(editable))];
            }else if ([weakSelf.view isKindOfClass:[UITextField class]] && attr == NO){
                ((UITextField *)weakSelf.view).delegate = weakSelf;
            }
            return weakSelf;
        };
    }
    return _editable;
}

-(BFormatTvPaddingAttr)textContainerInset
{
    if (_textContainerInset == nil) {
        
        __weak typeof(self) weakSelf = self;
        _textContainerInset = ^(UIEdgeInsets padding){
            if ([weakSelf.view isKindOfClass:[UITextView class]]) {
                [(UITextView *)weakSelf.view setTextContainerInset:padding];
            }
            
            return weakSelf;
        };
        
    }
    return _textContainerInset;
}

-(BFormatBorderAttr)topBorder
{
    if (_topBorder == nil) {
        __weak typeof(self) weakSelf = self;
        _topBorder = ^(UIColor *color, CGFloat size){
            [weakSelf.view v_setBorderPosition:LGBViewBorderPositionTop borderColor:color borderSize:size];
            return weakSelf;
        };
    }
    return _topBorder;
}

-(BFormatBorderAttr)leftBorder
{
    if (_leftBorder == nil) {
        __weak typeof(self) weakSelf = self;
        _leftBorder = ^(UIColor *color, CGFloat size){
            [weakSelf.view v_setBorderPosition:LGBViewBorderPositionLeft borderColor:color borderSize:size];
            return weakSelf;
        };
    }
    return _leftBorder;
}

-(BFormatBorderAttr)bottomBorder
{
    if (_bottomBorder == nil) {
        __weak typeof(self) weakSelf = self;
        _bottomBorder = ^(UIColor *color, CGFloat size){
            [weakSelf.view v_setBorderPosition:LGBViewBorderPositionBottom borderColor:color borderSize:size];
            return weakSelf;
        };
    }
    return _bottomBorder;
}

-(BFormatBorderAttr)rightBorder
{
    if (_rightBorder == nil) {
        __weak typeof(self) weakSelf = self;
        _rightBorder = ^(UIColor *color, CGFloat size){
            [weakSelf.view v_setBorderPosition:LGBViewBorderPositionRight borderColor:color borderSize:size];
            return weakSelf;
        };
    }
    return _rightBorder;
}

-(BFormatMutableAttr)textColorForString
{
    if (_textColorForString == nil) {
        __weak typeof(self) weakSelf = self;
        _textColorForString = ^(id attr, NSString *str){
            [weakSelf setView:weakSelf.view attributes:@{NSForegroundColorAttributeName: attr} string:str];
            return weakSelf;
        };
    }
    return _textColorForString;
}

-(BFormatMutableAttr)fontForString
{
    if (_fontForString == nil) {
        __weak typeof(self) weakSelf = self;
        _fontForString = ^(id attr, NSString *str){
            [weakSelf setView:weakSelf.view attributes:@{NSFontAttributeName: attr} string:str];
            return weakSelf;
        };
    }
    return _fontForString;
}

-(BFormatMutableAttr)backgroundColorForString
{
    if (_backgroundColorForString == nil) {
        __weak typeof(self) weakSelf = self;
        _backgroundColorForString = ^(id attr, NSString *str){
            [weakSelf setView:weakSelf.view attributes:@{NSBackgroundColorAttributeName: attr} string:str];
            return weakSelf;
        };
    }
    return _backgroundColorForString;
}

-(BFormatMutableUnderLineAttr)strikethroughForString
{
    if (_strikethroughForString == nil) {
        __weak typeof(self) weakSelf = self;
        _strikethroughForString = ^(NSInteger type, UIColor *color, NSString *str){
            [weakSelf setView:weakSelf.view attributes:@{NSStrikethroughStyleAttributeName: @(type), NSStrikethroughColorAttributeName: color} string:str];
            return weakSelf;
        };
    }
    return _strikethroughForString;
}

-(BFormatMutableUnderLineAttr)underlineForString
{
    if (_underlineForString == nil) {
        __weak typeof(self) weakSelf = self;
        _underlineForString = ^(NSInteger type, UIColor *color, NSString *str){
            [weakSelf setView:weakSelf.view attributes:@{NSUnderlineStyleAttributeName: @(type), NSUnderlineColorAttributeName: color} string:str];
            return weakSelf;
        };
    }
    return _underlineForString;
}

-(BFormatMutableSpaceAttr)lineSpace
{
    if (_lineSpace == nil) {
        __weak typeof(self) weakSelf = self;
        _lineSpace = ^(CGFloat space){
            [weakSelf.paragraphStyle setLineSpacing:space];
            [weakSelf setView:weakSelf.view attributes:@{NSParagraphStyleAttributeName: weakSelf.paragraphStyle} string:nil];
            return weakSelf;
        };
    }
    return _lineSpace;
}

-(BFormatMutableSpaceAttr)firstLineHeadIndent
{
    if (_firstLineHeadIndent == nil) {
        __weak typeof(self) weakSelf = self;
        _firstLineHeadIndent = ^(CGFloat space){
            [weakSelf.paragraphStyle setFirstLineHeadIndent:space];
            [weakSelf setView:weakSelf.view attributes:@{NSParagraphStyleAttributeName: weakSelf.paragraphStyle} string:nil];
            return weakSelf;
        };
    }
    return _firstLineHeadIndent;
}

-(BFormatBoolAttr)userInteractionEnabled
{
    if (_userInteractionEnabled == nil) {
        __weak typeof(self) weakSelf = self;
        _userInteractionEnabled = ^(BOOL attr){
            if ([weakSelf.view respondsToSelector:@selector(setUserInteractionEnabled:)]) {
                [weakSelf.view setValue:@(attr) forKey:NSStringFromSelector(@selector(userInteractionEnabled))];
            }
            return weakSelf;
        };
    }
    return _userInteractionEnabled;
}

-(BFormatIntegerAttr)clearButtonMode
{
    if (_clearButtonMode == nil) {
        __weak typeof(self) weakSelf = self;
        _clearButtonMode = ^(NSInteger attr){
            if ([weakSelf.view isKindOfClass:[UITextField class]]) {
                [weakSelf.view setValue:@(attr) forKey:NSStringFromSelector(@selector(clearButtonMode))];
            }
            return weakSelf;
        };
    }
    return _clearButtonMode;
}

-(BFormatBoolAttr)scrollEnabled
{
    if (_scrollEnabled == nil) {
        __weak typeof(self) weakSelf = self;
        _scrollEnabled = ^(BOOL attr){
            if ([weakSelf.view respondsToSelector:@selector(setScrollEnabled:)]) {
                [weakSelf.view setValue:@(attr) forKey:NSStringFromSelector(@selector(scrollEnabled))];
            }
            return weakSelf;
        };
    }
    return _scrollEnabled;
}

-(BFormatBoolAttr)showsVerticalScrollIndicator
{
    if (_showsVerticalScrollIndicator == nil) {
        __weak typeof(self) weakSelf = self;
        _showsVerticalScrollIndicator = ^(BOOL attr){
            if ([weakSelf.view respondsToSelector:@selector(setShowsVerticalScrollIndicator:)]) {
                [weakSelf.view setValue:@(attr) forKey:NSStringFromSelector(@selector(showsVerticalScrollIndicator))];
            }
            return weakSelf;
        };
    }
    return _showsVerticalScrollIndicator;
}

-(BFormatBoolAttr)showsHorizontalScrollIndicator
{
    if (_showsHorizontalScrollIndicator == nil) {
        __weak typeof(self) weakSelf = self;
        _showsHorizontalScrollIndicator = ^(BOOL attr){
            if ([weakSelf.view respondsToSelector:@selector(setShowsHorizontalScrollIndicator:)]) {
                [weakSelf.view setValue:@(attr) forKey:NSStringFromSelector(@selector(showsHorizontalScrollIndicator))];
            }
            return weakSelf;
        };
    }
    return _showsHorizontalScrollIndicator;
}

#pragma mark - private
-(BFormatAttr)formatAttrForSel:(SEL)sel
{
    __weak typeof(self) weakSelf = self;
    return ^(id attr){
        if ([weakSelf.view respondsToSelector:sel]) {
            [weakSelf.view setValue:attr forKey:NSStringFromSelector(sel)];
        }
        return weakSelf;
    };
}

-(void)setView:(id)view attributes:(NSDictionary *)attributes string:(NSString *)string
{
    if ([view respondsToSelector:@selector(attributedText)]) {
        NSAttributedString *attrString = [view attributedText];
        NSMutableAttributedString *text = nil;
        NSString *t = [view text] ? [view text] : @"";
        if (attrString) {
            text = [[NSMutableAttributedString alloc] initWithAttributedString:attrString];
        }else{
            text = [[NSMutableAttributedString alloc] initWithString:t];
        }
        
        if (text) {
            NSString *str = string ? string : t;
            NSRange range = [t rangeOfString:str];
            if (range.location == NSNotFound) {
                return;
            }
            [text addAttributes:attributes range:range];
            
            [view setValue:text forKey:NSStringFromSelector(@selector(attributedText))];
        }
    }
    
}

#pragma mark - private properties
-(NSMutableParagraphStyle *)paragraphStyle
{
    if (_paragraphStyle == nil) {
        _paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    }
    return _paragraphStyle;
}

#pragma mark - delegate
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return NO;
}

@end

@implementation UIView (LGBFormat)
-(LGBFormatManager *)lgb_format
{
    LGBFormatManager *manager = objc_getAssociatedObject(self, _cmd);
    if (!manager) {
        manager = [LGBFormatManager new];
        manager.view = self;
        objc_setAssociatedObject(self, _cmd, manager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return manager;
}
@end
