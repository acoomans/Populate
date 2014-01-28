//
//  ACIdenticonImageSet.h
//  Populate
//
//  Created by Arnaud Coomans on 28/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "ACImageSet.h"

@interface ACIdenticonImageSet : ACImageSet

/** Returns a random image.
 * @return An [identicon](https://en.wikipedia.org/wiki/Identicon).
 */
- (UIImage*)randomImage;

/** Number of images in the set.
 */
- (NSInteger)count;

@end
