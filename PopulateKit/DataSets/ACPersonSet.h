//
//  ACPersonSet.h
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ACNameSet.h"
#import "ACImageSet.h"
#import "ACPerson.h"

@interface ACPersonSet : NSObject

+ (instancetype)personSetWithRandomNameAndImage;

- (instancetype)initWithFirstNameSet:(ACNameSet*)firstnameSet
                         lastNameSet:(ACNameSet*)lastnameSet
                            imageSet:(ACImageSet*)imageSet;

- (ACPerson*)randomPerson;

@end
