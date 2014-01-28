//
//  ACPopulate.m
//  PopulateKit
//
//  Created by Arnaud Coomans on 27/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "ACPopulate.h"
#import <AddressBook/AddressBook.h>
#import "ACAddressBook.h"
#import "ACPerson.h"
#import "ACPersonSet.h"

@implementation ACPopulate

+ (void)populateGroupWithName:(NSString*)groupName
           withCountOfPersons:(NSUInteger)countOfPersons
                      fromSet:(ACPersonSet*)personSet
                   completion:(void (^)(void))block {
    [self populateGroupWithName:groupName withCountOfPersons:countOfPersons fromSets:@[personSet] completion:block];
}

+ (void)populateGroupWithName:(NSString*)groupName
           withCountOfPersons:(NSUInteger)countOfPersons
                     fromSets:(NSArray*)arrayOfPersonSets
                   completion:(void (^)(void))block {
    
    NSMutableArray *arrayOfPersons = [NSMutableArray arrayWithCapacity:countOfPersons];
    
    for (int i=countOfPersons; i>0; i--) {
        ACPersonSet *personSet = arrayOfPersonSets[arc4random_uniform(arrayOfPersonSets.count)];
        [arrayOfPersons addObject:[personSet randomPerson]];
    }
    
    [self populateGroupWithName:groupName withPersons:arrayOfPersons completion:block];
}

+ (void)populateGroupWithName:(NSString*)groupName withPersons:(NSArray*)arrayOfPersons completion:(void (^)(void))block {
    
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
        
        if (block) block();
    });
}

+ (void)depopulateGroupWithName:(NSString*)groupName completion:(void (^)(void))block {
    
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
        
        if (block) block();
    });
}

@end
