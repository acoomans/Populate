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


/** ACPerson is an Objective-C wrapper for AddressBook's ABPerson.
 */

@interface ACPerson : NSObject

/** @name Properties */

/** First name
 */
@property (nonatomic, copy) NSString *firstName;

/** Last name
 */
@property (nonatomic, copy) NSString *lastName;

/** Home email address
 */
@property (nonatomic, copy) NSString *email;

/** Home phone number
 */
@property (nonatomic, copy) NSString *phone;

/** Image
 */
@property (nonatomic, strong) UIImage *image;


/** Designated initializer
 */
- (instancetype)initWithFirstname:(NSString*)firstName
                         lastName:(NSString*)lastName
                            email:(NSString*)email
                            phone:(NSString*)phone
                            image:(UIImage*)image;

@end

ABRecordRef ABPersonCreateFromPerson(ACPerson *person);
