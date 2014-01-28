//
//  NSCharacterSet+NSSet.m
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "NSCharacterSet+NSSet.h"

#define UNICHAR_MAX (1ull << (CHAR_BIT * sizeof(unichar))) - 1


@implementation NSCharacterSet (NSSet)

+ (NSSet*)setFromCharacterSet:(NSCharacterSet*)characterSet {

    NSData *data = [characterSet bitmapRepresentation];
    uint8_t *ptr = (uint8_t *)[data bytes];
    NSMutableSet *set = [NSMutableSet set];
    // following from Apple's sample code
    for (unichar i = 0; i < UNICHAR_MAX; i++) {
        if (ptr[i >> 3] & (1u << (i & 7))) {
            [set addObject:[NSString stringWithCharacters:&i length:1]];
        }
    }
    return set;
}

@end
