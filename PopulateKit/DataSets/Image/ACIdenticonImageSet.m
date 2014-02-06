//
//  ACIdenticonImageSet.m
//  Populate
//
//  Created by Arnaud Coomans on 28/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#ifdef IGIDENTICON_AVAILABLE

#import "ACIdenticonImageSet.h"
#import <IGIdenticon.h>

@implementation ACIdenticonImageSet

- (UIImage*)randomImage {
    return [IGIdenticon identiconWithUInt32:arc4random() size:150];
}

- (NSInteger)count {
    return INT_MAX;
}

@end

#endif