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


/** A set of ACPerson.
 */

@interface ACPersonSet : NSObject

/** A set of ACPerson where the name and the image are generated randomly.
 */
+ (instancetype)personSetWithRandomNameAndImage;

- (instancetype)initWithFirstNameSet:(ACNameSet*)firstnameSet
                         lastNameSet:(ACNameSet*)lastnameSet
                            imageSet:(ACImageSet*)imageSet;

/** Returns a random ACPerson.
 */
- (ACPerson*)randomPerson;

@end
