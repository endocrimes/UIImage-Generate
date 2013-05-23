//
//  UIImage+Generate.h
//  DTThemeKit
//
//  Created by Danielle Lancashire on 11/05/2013.
//  Copyright (c) 2013 Shadow Developments. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Generate)
+ (UIImage *) initWithColor:(UIColor *)color;
+ (UIImage *) initWithColor:(UIColor *)color andWidth:(int)width andHeight:(int)height;
+ (UIImage *) initWithColor:(UIColor *)color withGraduationTo:(UIColor *)gcolor withHeight:(int)height;

@end
