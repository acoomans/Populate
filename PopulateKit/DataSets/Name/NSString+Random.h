//
//  NSString+Random.h
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Random)

+ (instancetype)randomString;
+ (instancetype)randomStringWithCharacterSet:(NSCharacterSet*)characterSet;
+ (instancetype)randomStringWithCharacterSet:(NSCharacterSet*)characterSet length:(NSUInteger)len;

@end
