//
//  ACCommonFemaleNameSet.m
//  Populate
//
//  Created by Arnaud Coomans on 28/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "ACCommonFemaleNameSet.h"

static NSString * const ACCommonFemaleNameSetResourceName = @"PopulateKit.bundle/common_female_names";

@interface ACCommonFemaleNameSet ()
- (NSArray*)names;
@end


@implementation ACCommonFemaleNameSet

- (NSArray*)names {
    static NSArray *_names = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
        NSString* fileRoot = [bundle pathForResource:ACCommonFemaleNameSetResourceName ofType:@"csv"];
        NSString* fileContents = [NSString stringWithContentsOfFile:fileRoot encoding:NSUTF8StringEncoding error:nil];
        _names = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    });
    return _names;
}

- (NSString*)randomName {
    return self.names[arc4random_uniform(self.names.count)];
}

- (NSInteger)count {
    return [self.names count];
}

@end
