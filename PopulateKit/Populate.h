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

- (void)populateGroupWithName:(NSString*)groupName withPersons:(NSArray*)arrayOfPersons;
- (void)populateGroupWithName:(NSString*)groupName withCountOfPersons:(NSUInteger)countOfPersons fromSet:(ACPersonSet*)personSet;
- (void)populateGroupWithName:(NSString*)groupName withCountOfPersons:(NSUInteger)countOfPersons fromSets:(NSArray*)arrayOfPersonSets;

- (void)depopulateGroupWithName:(NSString*)groupName;

@end
