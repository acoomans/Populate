//
//  ACRandomNameSet.m
//  Populate
//
//  Created by Arnaud Coomans on 26/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "ACRandomNameSet.h"
#import "NSString+Random.h"

@implementation ACRandomNameSet

- (NSString*)randomName {
    return [NSString randomString];
}

- (NSInteger)count {
    return INT_MAX;
}

@end
