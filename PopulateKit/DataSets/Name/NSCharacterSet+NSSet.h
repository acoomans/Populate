//
//  NSCharacterSet+NSSet.h
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCharacterSet (NSSet)

//Note: has to be a class method because NSCharacter is a class cluster
+ (NSSet*)setFromCharacterSet:(NSCharacterSet*)characterSet;

@end
