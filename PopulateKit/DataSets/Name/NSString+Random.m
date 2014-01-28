//
//  NSString+Random.m
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

// reimplementation of NSString+Randomized but with NSCharacterSet instead of "Alphabet"

#import "NSString+Random.h"
#import "NSCharacterSet+NSSet.h"

#define kNSStringRandomizedDefaultLength  8

@implementation NSString (Random)

+ (instancetype)randomString {
    NSCharacterSet *characterSet = [[NSLocale currentLocale] objectForKey:NSLocaleExemplarCharacterSet];
    return [self randomStringWithCharacterSet:characterSet];
}

+ (instancetype)randomStringWithCharacterSet:(NSCharacterSet*)characterSet {
    return [self randomStringWithCharacterSet:characterSet length:kNSStringRandomizedDefaultLength];
}

+ (instancetype)randomStringWithCharacterSet:(NSCharacterSet*)characterSet length:(NSUInteger)len {
    
    NSArray *characters = [[NSCharacterSet setFromCharacterSet:characterSet] allObjects];
    
    NSMutableString *string = [NSMutableString stringWithCapacity:len];
    for (NSUInteger i = 0; i < len; i++) {
        u_int32_t r = arc4random_uniform([characters count]);
        NSString *s = characters[r];
        [string appendFormat:@"%@", s];
    }
    return [NSString stringWithString:string];
}

@end
