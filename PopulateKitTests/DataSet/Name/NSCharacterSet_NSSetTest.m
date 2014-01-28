//
//  NSCharacterSet_NSSetTest.m
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Foundation/Foundation.h>
#import "NSCharacterSet+NSSet.h"

@interface NSCharacterSet_NSSetTest : XCTestCase
@end

@implementation NSCharacterSet_NSSetTest

- (void)testLowercaseCharacterSet {
    NSCharacterSet *charSet = [NSCharacterSet lowercaseLetterCharacterSet];
    NSSet *set = [NSCharacterSet setFromCharacterSet:charSet];
    XCTAssertTrue([set count] >= 26);
    //NSLog(@"%@", set);
}

- (void)testExemplarCharacterSet {
    NSCharacterSet *charSet = [[NSLocale currentLocale] objectForKey:NSLocaleExemplarCharacterSet];
    NSSet *set = [NSCharacterSet setFromCharacterSet:charSet];
    XCTAssertTrue([set count] > 0);
    //NSLog(@"%@", set);
}

@end
