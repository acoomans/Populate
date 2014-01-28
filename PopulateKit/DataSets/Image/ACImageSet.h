//
//  ACImageSet.h
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ACImageSet : NSObject

+ (instancetype)randomColorImageSet;

- (UIImage*)randomImage;
- (NSInteger)count;

@end
