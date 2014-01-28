//
//  Populate.h
//  PopulateKit
//
//  Created by Arnaud Coomans on 27/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ACPersonSet;

@interface Populate : NSObject

- (void)populateGroupWithName:(NSString*)groupName withPersons:(NSArray*)arrayOfPersons completion:(void(^)(void))block;
- (void)populateGroupWithName:(NSString*)groupName withCountOfPersons:(NSUInteger)countOfPersons fromSet:(ACPersonSet*)personSet completion:(void(^)(void))block;
- (void)populateGroupWithName:(NSString*)groupName withCountOfPersons:(NSUInteger)countOfPersons fromSets:(NSArray*)arrayOfPersonSets completion:(void(^)(void))block;

- (void)depopulateGroupWithName:(NSString*)groupName completion:(void(^)(void))block;

@end
