//
//  UIImage+pixelColor.h
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (pixelColor)
- (UIColor*)colorAtPoint:(CGPoint)point;
@end
