//
//  UIImage+Generate.m
//  DTThemeKit
//
//  Created by Danielle Lancashire on 11/05/2013.
//  Copyright (c) 2013 Shadow Developments. All rights reserved.
//

#import "UIImage+Generate.h"
#import "UIColor+Manipulate.h"
#import <QuartzCore/QuartzCore.h>
@implementation UIImage (Generate)

+ (UIImage *) initWithColor:(UIColor *)color {
    return [self genImageWithColor:color];
}

+ (UIImage *) initWithColor:(UIColor *)color andWidth:(int)width andHeight:(int)height {
    return [self imageWithColor:color andWidth:width andHeight:height];
}

+ (UIImage *) initWithColor:(UIColor *)color withGraduationTo:(UIColor *)gcolor withHeight:(int)height {
    UIImage *image = [self graduatedImageWithBase:color withGraduationTo:gcolor andHeight:height];
    return image;
}

+ (UIImage *)genImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // Create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);   // Fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color andWidth:(int)width andHeight:(int)height {
    CGRect rect = CGRectMake(0, 0, width, height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)graduatedImageWithBase:(UIColor *)base withGraduationTo:(UIColor *)graduated andHeight:(int)height {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = [NSArray arrayWithObjects:
                            (id)[base CGColor],
                            (id)[graduated CGColor], nil];
    gradientLayer.frame = CGRectMake(0, 0, 1, height);
    
    UIGraphicsBeginImageContext(CGSizeMake(1, height));
    [gradientLayer renderInContext: UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}
@end
