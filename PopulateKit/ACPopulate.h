//
//  ACPopulate.h
//  PopulateKit
//
//  Created by Arnaud Coomans on 27/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ACPersonSet;


/** ACPopulate let you easily add fake (randomly-generated) contacts to the iOS address book.
 *
 * ACPopulate uses ACPerson, an Objective-C wrapper for the ABPerson records from the AddressBook Kit. An array of ACPerson can be passed to the ACPopulate populateGroupWithName:withPersons:completion: method to be added to the address book.
 *
 * ACPopulate can also use one or multiple ACPersonSet, a set of persons with populateGroupWithName:withCountOfPersons:fromSet:completion: and populateGroupWithName:withCountOfPersons:fromSets:completion:. These methods choose randomly a given number of persons from those sets and add them to the address book.
 *
 * A group name can be specified, and is recommended, for easier manipulation and later deletion of the contacts. If a group already exists with the same name, the methods will reuse the existing group instead of making a new one.
 *
 * ** Be careful not to erase any real contact if you use ACPopulate on a real device! **
 */

@interface ACPopulate : NSObject

/** @name Adding contacts to the address book */

/** Add a list of persons to the address book.
 * @param groupName The name of the group to add the persons.
 * @param arrayOfPersons An array of ACPerson to be added to the address book.
 * @param block A block called when all persons are added.
 */
+ (void)populateGroupWithName:(NSString*)groupName withPersons:(NSArray*)arrayOfPersons completion:(void(^)(void))block;

/** Add a number of persons from a person set to the address book.
 * @param groupName The name of the group to add the persons.
 * @param countOfPersons Number of persons to be added to the address book.
 * @param personSet A set of persons.
 * @param block A block called when all persons are added.
 * @discussion A _countOfPersons_ number of persons from _personSet_ are randomly selected and added to the address book. If a group name was specified, the persons are added as members of group. If group with named _groupName_ already existed, it is used, otherwise a new group named _groupName_ is created.
 */
+ (void)populateGroupWithName:(NSString*)groupName withCountOfPersons:(NSUInteger)countOfPersons fromSet:(ACPersonSet*)personSet completion:(void(^)(void))block;

/** Add a number of persons from a list of person set to the address book.
 * @param groupName The name of the group to add the persons.
 * @param countOfPersons Number of persons to be added to the address book.
 * @param arrayOfPersonSets An array of set of persons.
 * @param block A block called when all persons are added.
 * @discussion A _countOfPersons_ number of persons from the sets in _arrayOfPersonSets_ are randomly selected and added to the address book. If _groupName_ was specified, the persons are added as members of _groupName_. If group with named _groupName_ already existed, it is used, otherwise a new group named _groupName_ is created.
 */
+ (void)populateGroupWithName:(NSString*)groupName withCountOfPersons:(NSUInteger)countOfPersons fromSets:(NSArray*)arrayOfPersonSets completion:(void(^)(void))block;

 
/** @name Removing contacts from the address book */

/** Removes all persons belonging to a group from the address book.
 * @param groupName The name of the group to remove.
 * @discussion The group and all its members are removed from the address book. The method has no effect if no group name was given.
 */
+ (void)depopulateGroupWithName:(NSString*)groupName completion:(void(^)(void))block;

@end
