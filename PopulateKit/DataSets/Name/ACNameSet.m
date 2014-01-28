//
//  ACNameSet.m
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "ACNameSet.h"
#import "ACRandomNameSet.h"
#import "ACCommonSurnameSet.h"

@implementation ACNameSet

+ (instancetype)randomNameSet {
    static ACRandomNameSet *_set = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _set = [[ACRandomNameSet alloc] init];
    });
    return _set;
}

+ (instancetype)commonSurnameSet {
    static ACCommonSurnameSet *_set = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _set = [[ACCommonSurnameSet alloc] init];
    });
    return _set;
}

- (NSString*)randomName {
    return nil;
}

- (NSInteger)count {
    return 0;
}

@end
