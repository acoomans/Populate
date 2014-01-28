//
//  ACRandomColorImageSet.h
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "ACImageSet.h"


/** ACRandomColorImageSet is a set of one-color images.
 */

@interface ACRandomColorImageSet : ACImageSet

/** Returns a random image.
 * @param size The size of the image.
 * @return a one randomly-chosen color image.
 */
- (UIImage*)randomImageWithSize:(CGSize)size;

/** Returns a random image.
 * @return a one randomly-chosen color image.
 */
- (UIImage*)randomImage;

/** Number of images in the set.
 */
- (NSInteger)count;
    
@end
