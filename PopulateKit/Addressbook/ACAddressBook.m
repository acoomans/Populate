//
//  ACAddressBook.m
//  ACAddressBook
//
//  Created by Arnaud Coomans on 25/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "ACAddressBook.h"


ABRecordRef ABAddressBookGetCopyGroupWithName(ABAddressBookRef addressBookRef, CFStringRef groupName) {
    ABRecordRef resultRef = NULL;
    
    CFArrayRef groupsRef = ABAddressBookCopyArrayOfAllGroups(addressBookRef);
    for (CFIndex i = 0; i < CFArrayGetCount(groupsRef); i++) {
        ABRecordRef groupRef = CFArrayGetValueAtIndex(groupsRef, i);
        CFStringRef name = ABRecordCopyValue(groupRef, kABGroupNameProperty);
        if (CFStringCompare(name, groupName, 0) == kCFCompareEqualTo) {
            resultRef = CFRetain(groupRef);
            CFRelease(name);
            break;
        }
        CFRelease(name);
    }
    CFRelease(groupsRef);
    
    return resultRef;
}

ABRecordRef ABAddressBookCreateGroupWithName(ABAddressBookRef addressBookRef, CFStringRef groupName) {
    CFErrorRef error = NULL;
    ABRecordRef groupRef = ABGroupCreate();
    ABRecordSetValue(groupRef, kABGroupNameProperty, groupName, &error);
    ABAddressBookAddRecord(addressBookRef, groupRef, &error);
    ABAddressBookSave(addressBookRef, &error);
    return groupRef;
}