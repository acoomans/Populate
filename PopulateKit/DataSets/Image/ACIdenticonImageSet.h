//
//  ACIdenticonImageSet.h
//  Populate
//
//  Created by Arnaud Coomans on 28/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "ACImageSet.h"

#if defined(__has_include)
#if __has_include("IGIdenticon.h") && __has_include(<IGIdenticon.h>)
#define IGIDENTICON_AVAILABLE 1
#endif
#endif


#ifdef IGIDENTICON_AVAILABLE

/** ACIdenticonImageSet is a set of [identicon](https://en.wikipedia.org/wiki/Identicon) images.
 */

@interface ACIdenticonImageSet : ACImageSet

/** Returns a random image.
 * @return An identicon.
 */
- (UIImage*)randomImage;

/** Number of images in the set.
 */
- (NSInteger)count;

@end

#endif
