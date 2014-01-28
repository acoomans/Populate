//
//  ACPopularSurnameSet.m
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "ACCommonSurnameSet.h"

@interface ACCommonSurnameSet ()
- (NSArray*)names;
@end

@implementation ACCommonSurnameSet

- (NSArray*)names {
    static NSArray *_names = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString* fileRoot = [[NSBundle mainBundle] pathForResource:@"PopulateKit.bundle/common_surnames" ofType:@"csv"];
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
