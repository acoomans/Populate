//
//  ACPerson.h
//  Populate
//
//  Created by Arnaud Coomans on 25/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>

@interface ACPerson : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, strong) UIImage *image;

- (instancetype)initWithFirstname:(NSString*)firstName
                         lastName:(NSString*)lastName
                            email:(NSString*)email
                            phone:(NSString*)phone
                            image:(UIImage*)image;

@end

ABRecordRef ABPersonCreateFromPerson(ACPerson *person);
