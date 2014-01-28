//
//  ACRandomNameSet.h
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "ACNameSet.h"


/** ACRandomNameSet is a set of random string of length 8 characters.
 */

@interface ACRandomNameSet : ACNameSet

/** Returns a random name.
 */
- (NSString*)randomName;

/** Number of names in the set.
 */
- (NSInteger)count;

@end
