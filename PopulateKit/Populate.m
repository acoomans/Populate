//
//  Populate.m
//  PopulateKit
//
//  Created by Arnaud Coomans on 27/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "Populate.h"
#import <AddressBook/AddressBook.h>
#import "ACAddressBook.h"
#import "ACPerson.h"
#import "ACPersonSet.h"

@implementation Populate

- (void)populateGroupWithName:(NSString*)groupName
           withCountOfPersons:(NSUInteger)countOfPersons
                      fromSet:(ACPersonSet*)personSet {
    [self populateGroupWithName:groupName withCountOfPersons:countOfPersons fromSets:@[personSet]];
}

- (void)populateGroupWithName:(NSString*)groupName
           withCountOfPersons:(NSUInteger)countOfPersons
                     fromSets:(NSArray*)arrayOfPersonSets {
    
    NSMutableArray *arrayOfPersons = [NSMutableArray arrayWithCapacity:countOfPersons];
    
    for (int i=countOfPersons; i>0; i--) {
        ACPersonSet *personSet = arrayOfPersonSets[arc4random_uniform(arrayOfPersonSets.count)];
        [arrayOfPersons addObject:[personSet randomPerson]];
    }
    
    [self populateGroupWithName:groupName withPersons:arrayOfPersons];
}

- (void)populateGroupWithName:(NSString*)groupName withPersons:(NSArray*)arrayOfPersons {
    
    CFErrorRef error = NULL;
    
    ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, &error);
    ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error) {
        
        ABRecordRef groupRef = NULL;
        if (groupName) {
            
            groupRef = ABAddressBookGetCopyGroupWithName(addressBookRef, (__bridge CFStringRef)(groupName));
            if (!groupRef) {
                groupRef = ABAddressBookCreateGroupWithName(addressBookRef, (__bridge CFStringRef)(groupName));
            }
        }
        
        for (ACPerson *person in arrayOfPersons) {
            ABRecordRef personRef = ABPersonCreateFromPerson(person);
            ABAddressBookAddRecord(addressBookRef, personRef, &error);
            ABAddressBookSave(addressBookRef, &error);

            if (groupRef) {
                ABGroupAddMember(groupRef, personRef, &error);
                ABAddressBookSave(addressBookRef, &error);
            }
            CFRelease(personRef);
        }

        ABAddressBookSave(addressBookRef, &error);
        NSLog(@"added records.");
        
        if (groupRef) {
            CFRelease(groupRef);
        }
        CFRelease(addressBookRef);
    });
}

- (void)depopulateGroupWithName:(NSString*)groupName {
    
    CFErrorRef error = NULL;
    
    ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, &error);
    ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error) {
        
        if (groupName) {
            ABRecordRef groupRef = ABAddressBookGetCopyGroupWithName(addressBookRef, (__bridge CFStringRef)(groupName));
            
            if (groupRef) {
                CFArrayRef personsRef = ABGroupCopyArrayOfAllMembers(groupRef);
                if (personsRef) {
                    for (CFIndex i = 0; i < CFArrayGetCount(personsRef); i++) {
                        ABRecordRef personRef = CFArrayGetValueAtIndex(personsRef, i);
                        ABAddressBookRemoveRecord(addressBookRef, personRef, &error);
                    }
                    CFRelease(personsRef);
                }
                
                ABAddressBookRemoveRecord(addressBookRef, groupRef, &error);
                ABAddressBookSave(addressBookRef, &error);
                NSLog(@"removed records.");
                
                CFRelease(groupRef);
            }
        }
        CFRelease(addressBookRef);
    });
}

@end
