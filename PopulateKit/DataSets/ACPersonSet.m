//
//  ACPersonSet.m
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "ACPersonSet.h"


@interface ACPersonSet ()
@property (nonatomic, strong) ACNameSet *firstNameSet;
@property (nonatomic, strong) ACNameSet *lastNameSet;
@property (nonatomic, strong) ACImageSet *imageSet;
@property (nonatomic, strong) NSString *emailDomain;
@property (nonatomic, strong) NSString *phonePrefix;
@end

@implementation ACPersonSet

+ (instancetype)personSetWithRandomNameAndImage {
    return [[self.class alloc] initWithFirstNameSet:[ACNameSet randomNameSet]
                                        lastNameSet:[ACNameSet randomNameSet]
                                           imageSet:[ACImageSet randomColorImageSet]];
}

+ (instancetype)setWithFirstNameSet:(ACNameSet*)firstnameSet
                        lastNameSet:(ACNameSet*)lastnameSet
                           imageSet:(ACImageSet*)imageSet {
    return [[self.class alloc] initWithFirstNameSet:firstnameSet
                                        lastNameSet:lastnameSet
                                           imageSet:imageSet];
}

- (instancetype)initWithFirstNameSet:(ACNameSet*)firstnameSet
                         lastNameSet:(ACNameSet*)lastnameSet
                            imageSet:(ACImageSet*)imageSet {
    self = [super init];
    if (self) {
        _firstNameSet = firstnameSet;
        _lastNameSet = lastnameSet;
        _imageSet = imageSet;
        _emailDomain = @"example.com";
        _phonePrefix = @"1555";
    }
    return self;
}

- (id)init {
    return [self initWithFirstNameSet:nil
                          lastNameSet:nil
                             imageSet:nil];
}

- (ACPerson*)randomPerson {
    NSString *firstName = [self.firstNameSet randomName];
    NSString *lastName = [self.lastNameSet randomName];
    
    return [[ACPerson alloc] initWithFirstname:firstName
                                      lastName:lastName
                                         email:[NSString stringWithFormat:@"%@.%@@%@", firstName, lastName, self.emailDomain]
                                         phone:[NSString stringWithFormat:@"%@%03d", self.phonePrefix, arc4random_uniform(9999999)]
                                         image:[self.imageSet randomImage]];
}

@end
