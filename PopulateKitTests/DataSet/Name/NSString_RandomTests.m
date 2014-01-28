//
//  NSString_RandomTests.m
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Random.h"

@interface NSString_RandomTests : XCTestCase
@end

@implementation NSString_RandomTests

- (void)testRandomStringWithCharacterSetAndLength {
    NSString *string = [NSString randomStringWithCharacterSet:[NSCharacterSet lowercaseLetterCharacterSet] length:12];
    XCTAssertTrue(string.length == 12);
    for (int i = 0; i < string.length-1; i++) {
        unichar a = [string characterAtIndex:i];
        unichar b = [string characterAtIndex:i+1];
        if (a != b) {
            return;
        } else if (i == string.length-2) {
            XCTFail();
        }
    }
                  
}

@end
