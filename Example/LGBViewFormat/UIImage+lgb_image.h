//
//  UIImage+lgb_image.h
//  ImageCategory
//
//  Created by lgb789 on 16/5/12.
//  Copyright © 2016年 com.lgb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (lgb_image)

/**
 根据颜色和圆角创建Image对象
 
 @param color 颜色
 @param cornerRadius 圆角半径
 @return Image对象
 */
+(UIImage *)lgb_imageWithColor:(UIColor *)color
                  cornerRadius:(CGFloat)cornerRadius;

/**
 根据颜色创建Image对象
 
 @param color 颜色
 @return Image对象
 */
+(UIImage *)lgb_imageWithColor:(UIColor *)color;

/**
 根据颜色大小创建圆形图片
 
 @param color 颜色
 @param size 大小
 @return Image对象
 */
+(UIImage *)lgb_circleImageWithColor:(UIColor *)color
                                size:(CGSize)size;

/**
 根据模糊值创建模糊图片
 
 @param image 原图
 @param blurValue 模糊值，数值越大越模糊
 @return 模糊图片
 */
+(UIImage *)lgb_blurImage:(UIImage *)image blurValue:(CGFloat)blurValue;

/**
 创建视图的快照
 
 @param view 视图
 @return 快照
 */
+(UIImage *)lgb_imageFromView:(UIView *)view;

/**
 根据layer生成图片
 
 @param layer layer
 @return UIImage
 */
+(UIImage *)lgb_imageFromLayer:(CALayer *)layer;

//resize image
+(UIImage *)lgb_scaleImage:(UIImage *)image toSize:(CGSize)newSize inRect:(CGRect)rect;

+(UIImage *)lgb_scaleImage:(UIImage *)image fitToSize:(CGSize)newSize;

+(UIImage *)lgb_scaleImage:(UIImage *)image fillToSize:(CGSize)newSize;

#pragma mark - *********************** 对象方法 ***********************

/**
 设置图片圆角
 
 @param radius 圆角半径
 @return 图片
 */
-(UIImage *)lgb_imageWithCornerRadius:(CGFloat)radius;


/**
 旋转图片

 @param degrees 角度
 @return 图片
 */
-(UIImage*)lgb_imageRotatedByDegrees:(CGFloat)degrees;
@end
