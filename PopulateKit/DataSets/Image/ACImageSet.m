//
//  ACImageSet.m
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "ACImageSet.h"
#import "ACRandomColorImageSet.h"

@implementation ACImageSet

+ (instancetype)randomColorImageSet {
    static ACRandomColorImageSet *_set = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _set = [[ACRandomColorImageSet alloc] init];
    });
    return _set;
}

- (UIImage*)randomImage {
    return nil;
}

- (NSInteger)count {
    return 0;
}


@end
