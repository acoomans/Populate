//
//  ACCommonMaleNameSet.m
//  Populate
//
//  Created by Arnaud Coomans on 28/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "ACCommonMaleNameSet.h"

static NSString * const ACCommonMaleNameSetResourceName = @"PopulateKit.bundle/common_male_names";

@interface ACCommonMaleNameSet ()
- (NSArray*)names;
@end


@implementation ACCommonMaleNameSet

- (NSArray*)names {
    static NSArray *_names = nil;
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
        NSString* fileRoot = [bundle pathForResource:ACCommonMaleNameSetResourceName ofType:@"csv"];
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
