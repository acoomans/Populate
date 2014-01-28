//
//  ACNameSet.h
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ACNameSet : NSObject

+ (instancetype)randomNameSet;

- (NSString*)randomName;
- (NSInteger)count;

@end
