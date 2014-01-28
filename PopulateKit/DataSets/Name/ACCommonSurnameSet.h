//
//  ACCommonSurnameSet.h
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "ACNameSet.h"

/** ACCommonSurnameSet is a set containing the 100 most common surnames in the United States of America in the year 2000. The list comes from the List of most common surnames in North America on [Wikipedia]( http://en.wikipedia.org/wiki/List_of_most_common_surnames_in_North_America ).
 */

@interface ACCommonSurnameSet : ACNameSet

/** Returns one common surname chosen at random.
 */
- (NSString*)randomName;

/** Number of names in the set.
 */
- (NSInteger)count;

@end
