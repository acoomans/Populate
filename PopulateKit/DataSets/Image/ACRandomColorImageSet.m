//
//  ACRandomColorImageSet.m
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "ACRandomColorImageSet.h"
#import "UIImage+Random.h"

@implementation ACRandomColorImageSet

- (UIImage*)randomImage {
    return [self randomImageWithSize:CGSizeMake(150, 150)];
}

- (UIImage*)randomImageWithSize:(CGSize)size {
    return [UIImage imageWithRandomColorOfSize:size];
}

- (NSInteger)count {
    return INT_MAX;
}

@end
