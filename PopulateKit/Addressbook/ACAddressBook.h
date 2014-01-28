//
//  ACAddressBook.h
//  ACAddressBook
//
//  Created by Arnaud Coomans on 25/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import <AddressBook/AddressBook.h>

ABRecordRef ABAddressBookGetCopyGroupWithName(ABAddressBookRef addressBookRef, CFStringRef groupName);

ABRecordRef ABAddressBookCreateGroupWithName(ABAddressBookRef addressBookRef, CFStringRef groupName);