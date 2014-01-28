//
//  ACNameSet.h
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import <Foundation/Foundation.h>

/** A set of names for persons.
 *
 * This is an abstract class and a class cluster. Do not use it directly but call one of class methods like randomNameSet to get a subclass.
 */

@interface ACNameSet : NSObject

/** A set of random names.
 */
+ (instancetype)randomNameSet;

/** A set of common surnames.
 */
+ (instancetype)commonSurnameSet;

/** A set of common male names.
 */
+ (instancetype)commonMaleNameSet;

/** A set of common female names.
 */
+ (instancetype)commonFemaleNameSet;


/** Returns a random name.
 * @discussion the default implementation returns nil.
 */
- (NSString*)randomName;

/** Number of names in the set
 * @discussion the default implementation returns 0.
 */
- (NSInteger)count;

@end
