//
//  ACImageSet.h
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/** A set of images to represent persons.
 *
 * This is an abstract class and a class cluster. Do not use it directly but call one of class methods like randomColorImageSet to get a subclass.
 */

@interface ACImageSet : NSObject

/** A set of random images.
 */
+ (instancetype)randomColorImageSet;

#ifdef IGIDENTICON_AVAILABLE
/** A set of identicon.
 */
+ (instancetype)identiconImageSet;
#endif

/** A set of male faces.
 */
+ (instancetype)maleFaceImageSet;

/** A set of female faces.
 */
+ (instancetype)femaleFaceImageSet;

/** Returns a random image
 * @discussion the default implementation returns nil.
 */
- (UIImage*)randomImage;

/** Number of images in the set
 * @discussion the default implementation returns 0.
 */
- (NSInteger)count;

@end
