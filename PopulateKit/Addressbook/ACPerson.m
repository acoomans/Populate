//
//  ACPerson.m
//  Populate
//
//  Created by Arnaud Coomans on 25/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "ACPerson.h"


ABRecordRef ABRecordCreateFromPerson(ACPerson *person);

@implementation ACPerson

- (instancetype)initWithFirstname:(NSString*)firstName
                         lastName:(NSString*)lastName
                            email:(NSString*)email
                            phone:(NSString*)phone
                            image:(UIImage*)image {
    self = [super init];
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
        _email = email;
        _phone = phone;
        _image = image;
    }
    return self;
}

ABRecordRef ABPersonCreateFromPerson(ACPerson *person) {
    
    ABRecordRef recordRef = ABPersonCreate();

    ABRecordSetValue(recordRef, kABPersonFirstNameProperty, (__bridge CFTypeRef)(person.firstName), NULL);
    ABRecordSetValue(recordRef, kABPersonLastNameProperty, (__bridge CFTypeRef)(person.lastName), NULL);
    
    ABMutableMultiValueRef emailsMultiValueRef = ABMultiValueCreateMutable(kABStringPropertyType);
    ABMultiValueAddValueAndLabel(emailsMultiValueRef, (__bridge CFTypeRef)(person.email), kABHomeLabel, NULL);
    ABRecordSetValue(recordRef, kABPersonEmailProperty, emailsMultiValueRef, NULL);
    CFRelease(emailsMultiValueRef);

    ABMutableMultiValueRef phonesMultiValueRef = ABMultiValueCreateMutable(kABStringPropertyType);
    ABMultiValueAddValueAndLabel(phonesMultiValueRef, (__bridge CFTypeRef)(person.phone), kABHomeLabel, NULL);
    ABRecordSetValue(recordRef, kABPersonPhoneProperty, phonesMultiValueRef, NULL);
    CFRelease(phonesMultiValueRef);
    
    NSData *data = UIImagePNGRepresentation(person.image);
    CFDataRef dataRef = CFDataCreate(NULL, [data bytes], [data length]);
    ABPersonSetImageData (recordRef, dataRef, nil);
    CFRelease(dataRef);
    
    return recordRef;
}

- (NSString*)description {
    return [NSString stringWithFormat:@"%@ %@ %@", [super description], self.firstName, self.lastName];
}

@end
