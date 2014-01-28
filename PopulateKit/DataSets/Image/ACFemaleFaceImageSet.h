//
//  ACFemaleFaceImageSet.h
//  Populate
//
//  Created by Arnaud Coomans on 28/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "ACImageSet.h"

/** ACFemaleFaceImageSet is a set of photos of female faces from from Greg Peverill-Conti ([@gregpc](https://twitter.com/gregpc))'s [1000 faces sets on Flickr](http://www.flickr.com/photos/gregpc).
 *
 * All images are under Creative Commons license: [Attribution-NonCommercial-ShareAlike 2.0 Generic (CC BY-NC-SA 2.0)](http://creativecommons.org/licenses/by-nc-sa/2.0/deed.en)
 *
 * See the FACES.md file for complete credits.
 */

@interface ACFemaleFaceImageSet : ACImageSet

/** Returns a face.
 * @return An photo of a female face.
 */
- (UIImage*)randomImage;

/** Number of images in the set.
 */
- (NSInteger)count;

@end
