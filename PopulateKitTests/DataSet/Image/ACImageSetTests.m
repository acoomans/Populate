//
//  ACImageSetTests.m
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <UIKit/UIKit.h>

#import "UIImage+pixelColor.h"
#import "ACImageSet.h"

@interface ACImageSetTests : XCTestCase
@end

@implementation ACImageSetTests

#pragma mark - ACRandomColorImageSet

- (void)testRandomColorImageSet {
    UIImage *image = [[ACImageSet randomColorImageSet] randomImage];
    XCTAssertTrue(image.size.width > 0);
    XCTAssertTrue(image.size.height > 0);
    
    UIColor *color = [image colorAtPoint:CGPointMake(image.size.width/2, image.size.height/2)];
    CGFloat red, green, blue;
    XCTAssertTrue([color getRed:&red green:&green blue:&blue alpha:NULL]);
    XCTAssertTrue(red > 0 || green > 0 || blue > 0);
    XCTAssertTrue(red < 1 || green < 1 || blue < 1);
}

#pragma mark - ACIdenticonImageSet

- (void)testIdenticonImageSet {
    UIImage *image = [[ACImageSet identiconImageSet] randomImage];
    XCTAssertTrue(image.size.width > 0);
    XCTAssertTrue(image.size.height > 0);
}

#pragma mark - ACMaleFaceImageSet

- (void)testMaleFaceImageSet {
    UIImage *image = [[ACImageSet maleFaceImageSet] randomImage];
    XCTAssertTrue(image.size.width > 0);
    XCTAssertTrue(image.size.height > 0);
}

#pragma mark - ACFemaleFaceImageSet

- (void)testFemaleFaceImageSet {
    UIImage *image = [[ACImageSet femaleFaceImageSet] randomImage];
    XCTAssertTrue(image.size.width > 0);
    XCTAssertTrue(image.size.height > 0);
}

@end
