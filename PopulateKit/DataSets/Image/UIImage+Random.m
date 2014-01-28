//
//  UIImage+Random.m
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "UIImage+Random.h"

@implementation UIImage (Random)

+ (UIImage*)imageWithColor:(UIColor*)color size:(CGSize)size {
    
    size_t bitsPerComponent = 8;
    size_t bytesPerPixel    = 4;
    size_t bytesPerRow      = (size.width * bitsPerComponent * bytesPerPixel + 7) / 8;
    size_t dataSize         = bytesPerRow * size.height;
    
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    
    int *data = malloc(dataSize);
    memset(data, 0, dataSize);
    
    CGContextRef contextRef = CGBitmapContextCreate(data,
                                                    size.width,
                                                    size.height,
                                                    bitsPerComponent,
                                                    bytesPerRow, colorSpaceRef,
                                                    kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    
    CGContextSetFillColorWithColor(contextRef, color.CGColor);
    
    CGContextFillRect(contextRef,
                      CGRectMake(
                                 0,
                                 0,
                                 size.width,
                                 size.height));
    
    CGColorSpaceRelease(colorSpaceRef);
    CGImageRef imageRef = CGBitmapContextCreateImage(contextRef);
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    CGContextRelease(contextRef);
    free(data);
    
    return image;
}

+ (UIImage*)imageWithRandomColorOfSize:(CGSize)size {
    UIColor *randomColor = [UIColor colorWithRed:drand48() green:drand48() blue:drand48() alpha:1.0];
    return [self imageWithColor:randomColor size:size];
}

@end
