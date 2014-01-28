//
//  ACCommonFemaleNameSet.h
//  Populate
//
//  Created by Arnaud Coomans on 28/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "ACNameSet.h"

/** ACCommonFemaleNameSet is a set containing the 200 most common names for females in the United States of America between 2000 - 2009. The list comes from Top names of the 2000s [Social Security Administration](http://www.ssa.gov/OACT/babynames/decades/names2000s.html).
 */

@interface ACCommonFemaleNameSet : ACNameSet

/** Returns one common female name chosen at random.
 */
- (NSString*)randomName;

/** Number of names in the set.
 */
- (NSInteger)count;


@end
