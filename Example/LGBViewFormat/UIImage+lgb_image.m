//
//  UIImage+lgb_image.m
//  ImageCategory
//
//  Created by lgb789 on 16/5/12.
//  Copyright © 2016年 com.lgb. All rights reserved.
//

#import "UIImage+lgb_image.h"

@implementation UIImage (lgb_image)

#pragma mark - *********************** 创建UIImage对象 ***********************
//圆角图片
+(UIImage *)lgb_imageWithColor:(UIColor *)color
                  cornerRadius:(CGFloat)cornerRadius
{
    CGSize minSize = CGSizeMake(cornerRadius * 2 + 1, cornerRadius * 2 + 1);
    //    CGSize minSize = size;
    UIGraphicsBeginImageContextWithOptions(minSize, NO, [[UIScreen mainScreen] scale]);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, minSize.width, minSize.height) cornerRadius:cornerRadius];
    [color setFill];
    [color setStroke];
    
    [path addClip];
    [path fill];
    [path stroke];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    img = [img resizableImageWithCapInsets:UIEdgeInsetsMake(cornerRadius, cornerRadius, cornerRadius, cornerRadius)];
    
    return img;
}

//颜色图片
+(UIImage *)lgb_imageWithColor:(UIColor *)color
{
    return [self lgb_imageWithColor:color cornerRadius:0];
}

//圆形图片
+(UIImage *)lgb_circleImageWithColor:(UIColor *)color
                                size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, [[UIScreen mainScreen] scale]);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [color setFill];
    [color setStroke];
    
    [path addClip];
    [path fill];
    [path stroke];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

//模糊图片
+(UIImage *)lgb_blurImage:(UIImage *)image blurValue:(CGFloat)blurValue
{
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    
    //因为在模糊的时候，边缘会变成半透明的状态，所以理想状况是可以对原图像进行适当放大，选择使用CIAffineClamp在模糊之前对图像进行处理
    CIFilter *affineClampFilter = [CIFilter filterWithName:@"CIAffineClamp"];
    CGAffineTransform xform = CGAffineTransformMakeScale(1.0, 1.0);
    [affineClampFilter setValue:inputImage forKey:kCIInputImageKey];
    [affineClampFilter setValue:[NSValue valueWithBytes:&xform
                                               objCType:@encode(CGAffineTransform)]
                         forKey:@"inputTransform"];
    
    CIImage *extendedImage = [affineClampFilter valueForKey:kCIOutputImageKey];
    
    //模糊滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:extendedImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:blurValue] forKey:@"inputRadius"];
    
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    
    CIContext *context = [CIContext contextWithOptions:nil];
    // CIGaussianBlur has a tendency to shrink the image a little,
    // this ensures it matches up exactly to the bounds of our original image
    CGImageRef cgImage = [context createCGImage:result fromRect:[inputImage extent]];
    
    UIImage *returnImage = [UIImage imageWithCGImage:cgImage];
    //ARC不会释放CGImageRef，需要手动释放
    CGImageRelease(cgImage);
    
    return returnImage;
}

//view图片
+(UIImage *)lgb_imageFromView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [[UIScreen mainScreen] scale]);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

//layer图片
+(UIImage *)lgb_imageFromLayer:(CALayer *)layer
{
//    UIGraphicsBeginImageContext([layer frame].size);
    UIGraphicsBeginImageContextWithOptions([layer frame].size, NO, [[UIScreen mainScreen] scale]);
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

//resize https://developer.apple.com/library/content/samplecode/sc2273/Listings/AirDropSample_UIImage_Resize_m.html
+(UIImage *)lgb_scaleImage:(UIImage *)image toSize:(CGSize)newSize inRect:(CGRect)rect
{
    //Determine whether the screen is retina
    if ([[UIScreen mainScreen] scale] == 2.0) {
        UIGraphicsBeginImageContextWithOptions(newSize, YES, 2.0);
    }
    else
    {
        UIGraphicsBeginImageContext(newSize);
    }
    
    //Draw image in provided rect
    [image drawInRect:rect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //Pop this context
    UIGraphicsEndImageContext();
    
    return newImage;
}

+(UIImage *)lgb_scaleImage:(UIImage *)image fitToSize:(CGSize)newSize
{
    //Only scale images down
    if (image.size.width < newSize.width && image.size.height < newSize.height) {
        return [image copy];
    }
    
    //Determine the scale factors
    CGFloat widthScale = newSize.width/image.size.width;
    CGFloat heightScale = newSize.height/image.size.height;
    
    CGFloat scaleFactor;
    
    //The smaller scale factor will scale more (0 < scaleFactor < 1) leaving the other dimension inside the newSize rect
    widthScale < heightScale ? (scaleFactor = widthScale) : (scaleFactor = heightScale);
    CGSize scaledSize = CGSizeMake(image.size.width * scaleFactor, image.size.height * scaleFactor);
    
    //Scale the image
    
    return [UIImage lgb_scaleImage:image toSize:scaledSize inRect:CGRectMake(0, 0, scaledSize.width, scaledSize.height)];
    
}

+(UIImage *)lgb_scaleImage:(UIImage *)image fillToSize:(CGSize)newSize
{
    //Only scale images down
    if (image.size.width < newSize.width && image.size.height < newSize.height) {
        return [image copy];
    }
    
    //Determine the scale factors
    CGFloat widthScale = newSize.width/image.size.width;
    CGFloat heightScale = newSize.height/image.size.height;
    
    CGFloat scaleFactor;
    
    //The larger scale factor will scale less (0 < scaleFactor < 1) leaving the other dimension hanging outside the newSize rect
    widthScale > heightScale ? (scaleFactor = widthScale) : (scaleFactor = heightScale);
    CGSize scaledSize = CGSizeMake(image.size.width * scaleFactor, image.size.height * scaleFactor);
    
    //Create origin point so that the center of the image falls into the drawing context rect (the origin will have negative component).
    CGPoint imageDrawOrigin = CGPointMake(0, 0);
    widthScale > heightScale ?  (imageDrawOrigin.y = (newSize.height - scaledSize.height) * 0.5) :
    (imageDrawOrigin.x = (newSize.width - scaledSize.width) * 0.5);
    
    
    //Create rect where the image will draw
    CGRect imageDrawRect = CGRectMake(imageDrawOrigin.x, imageDrawOrigin.y, scaledSize.width, scaledSize.height);
    
    //The imageDrawRect is larger than the newSize rect, where the imageDraw origin is located defines what part of
    //the image will fall into the newSize rect.
    
    return [UIImage lgb_scaleImage:image toSize:newSize inRect:imageDrawRect];
    
}

#pragma mark - *********************** 对象方法 ***********************
//设置图片圆角
-(UIImage *)lgb_imageWithCornerRadius:(CGFloat)radius
{
//    UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
    UIGraphicsBeginImageContext(self.size);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    [path addClip];
    [self drawInRect:rect];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

-(UIImage*)lgb_imageRotatedByDegrees:(CGFloat)degrees
{
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
    
    CGSize rotatedSize;
    
    rotatedSize.width = width;
    rotatedSize.height = height;
    
    UIGraphicsBeginImageContext(rotatedSize);
//    UIGraphicsBeginImageContextWithOptions(rotatedSize, NO, [[UIScreen mainScreen] scale]);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    // Move the origin to the middle of the image so we will rotate and scale around the center.
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
    // Rotate the image context
    CGContextRotateCTM(bitmap, degrees * M_PI / 180);

    // Now, draw the rotated/scaled image into the context
    CGContextScaleCTM(bitmap, 1.0, -1.0);
    CGContextDrawImage(bitmap, CGRectMake(-rotatedSize.width/2, -rotatedSize.height/2, rotatedSize.width, rotatedSize.height), self.CGImage);
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
























