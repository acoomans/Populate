//
//  ACPersonSetTests.m
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "ACPersonSet.h"
#import "ACNameSet.h"
#import "ACImageSet.h"

@interface ACPersonSetTests : XCTestCase
@end

@implementation ACPersonSetTests

- (void)testRandomContact {
    ACPersonSet *personSet = [[ACPersonSet alloc] initWithFirstNameSet:[ACNameSet randomNameSet]
                                                              lastNameSet:[ACNameSet randomNameSet]
                                                                 imageSet:[ACImageSet randomColorImageSet]];
    
    ACPerson *person = [personSet randomPerson];
    XCTAssertTrue(person.firstName.length > 0);
    XCTAssertTrue(person.lastName.length > 0);
    XCTAssertTrue(person.email.length > 0 && [person.email rangeOfString:@"@"].location != NSNotFound);
    XCTAssertTrue(person.phone.length > 0);
    XCTAssertTrue(person.image.size.width > 0 && person.image.size.height > 0);
}

@end
