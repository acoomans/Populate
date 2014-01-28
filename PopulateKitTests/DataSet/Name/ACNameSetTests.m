//
//  ACNameSetTests.m
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ACNameSet.h"

@interface ACNameSetTests : XCTestCase
@end

@implementation ACNameSetTests


#pragma mark - ACRandomNameSet

- (void)testRandomNameSet {
    NSString *name = [[ACNameSet randomNameSet] randomName];
    XCTAssertTrue([name length] > 0);
    NSLog(@"%@", name);
}

- (void)testDifferentRandomNameSet {
    NSString *a = [[ACNameSet randomNameSet] randomName];
    NSString *b = [[ACNameSet randomNameSet] randomName];
    XCTAssertFalse([a isEqualToString:b]);
    NSLog(@"a = %@", a);
    NSLog(@"b = %@", b);
}

#pragma mark - ACCommonSurnameSet

- (void)testCommonSurnameSet {
    NSString *name = [[ACNameSet commonSurnameSet] randomName];
    XCTAssertTrue([name length] > 0);
    NSLog(@"%@", name);
}

- (void)testCommonSurnameSetCount {
    XCTAssertTrue([[ACNameSet commonSurnameSet] count] > 0);
}

- (void)testDifferentCommonSurnameSet {
    NSString *a = [[ACNameSet commonSurnameSet] randomName];
    NSString *b = [[ACNameSet commonSurnameSet] randomName];
    XCTAssertFalse([a isEqualToString:b]);
    NSLog(@"a = %@", a);
    NSLog(@"b = %@", b);
}

#pragma mark - ACCommonMaleSet

- (void)testCommonMaleNameSet {
    NSString *name = [[ACNameSet commonMaleNameSet] randomName];
    XCTAssertTrue([name length] > 0);
    NSLog(@"%@", name);
}

- (void)testCommonMaleNameSetCount {
    XCTAssertTrue([[ACNameSet commonMaleNameSet] count] > 0);
}

- (void)testDifferentCommonMaleNameSet {
    NSString *a = [[ACNameSet commonMaleNameSet] randomName];
    NSString *b = [[ACNameSet commonMaleNameSet] randomName];
    XCTAssertFalse([a isEqualToString:b]);
    NSLog(@"a = %@", a);
    NSLog(@"b = %@", b);
}

#pragma mark - ACCommonFemaleSet

- (void)testCommonFemaleNameSet {
    NSString *name = [[ACNameSet commonFemaleNameSet] randomName];
    XCTAssertTrue([name length] > 0);
    NSLog(@"%@", name);
}

- (void)testCommonFemaleNameSetCount {
    XCTAssertTrue([[ACNameSet commonFemaleNameSet] count] > 0);
}

- (void)testDifferentCommonFemaleNameSet {
    NSString *a = [[ACNameSet commonFemaleNameSet] randomName];
    NSString *b = [[ACNameSet commonFemaleNameSet] randomName];
    XCTAssertFalse([a isEqualToString:b]);
    NSLog(@"a = %@", a);
    NSLog(@"b = %@", b);
}



@end
