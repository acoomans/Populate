# Populate

Populate is both an iOS app and library to easily create random-generated contacts.

- the Populate app let you configure and add contacts to the iOS address book.
- the PopulateKit library let you create contacts for either adding to the address book or any other purpose.


[![Build Status](https://api.travis-ci.org/acoomans/Populate.png)](https://api.travis-ci.org/acoomans/Populate.png)
[![Cocoapods](https://cocoapod-badges.herokuapp.com/v/PopulateKit/badge.png)](http://beta.cocoapods.org/?q=on%3Aios%20name%3APopulateKit%2A)
[![Cocoapods](https://cocoapod-badges.herokuapp.com/p/PopulateKit/badge.png)](http://beta.cocoapods.org/?q=on%3Aios%20name%3APopulateKit%2A)


## Screenshots

![screenshot01](https://github.com/acoomans/Populate/raw/master/Screenshots/screenshot01.png)
&nbsp;&nbsp;
![screenshot02](https://github.com/acoomans/Populate/raw/master/Screenshots/screenshot02.png)


## Populate app

### Run the app

1. Install the [pods](http://cocoapods.org) with `pod install`
2. Open _Populate.xcworkspace_ (the **workspace**, not the project), build it and run it
3. Choose a group name (useful for later deletion), number of contacts, type of name and type of photo
5. Tap _populate_ to add the contacts
6. Tap _depopulate_ to remove the group and all its member contacts

You can tap _contacts_ to open the address book without switching apps.


** Be careful not to erase your real contact if you use Populate on a real device **


## PopulateKit library

### Install with [CocoaPods](http://cocoapods.org)

Add a pod entry to your Podfile:

    pod 'PopulateKit', '~> 0.0.4'

Install the pod(s) by running:

    pod install
    
### Install manually

1. clone this repository
2. add the files in the _PopulateKit_ directory to your project
3. link your app with the _AddressBook_ framework
4. set `OTHER_LINKER_FLAGS="-ObjC" for your target

If you want the (optional) identicons, you should also add [IGIdenticon](https://github.com/Seaburg/IGIdenticon) to your project.

### Usage

Import the header

	#import "PopulateKit.h"
	
#### Adding contacts to the address book

To add hand-made contacts to the address book, create the contacts with the _ACPerson_ wrapper and add them to _Test_ group in the address book:

	ACPerson *personA = [[ACPerson alloc] initWithFirstname:@"Alice"
                                                   lastName:@"A"
                                                      email:@"alice@example.com"
                                                      phone:@"555-111-1111"
                                                      image:nil];
    ACPerson *personB = [[ACPerson alloc] initWithFirstname:@"Bob"
                                                   lastName:@"B"
                                                      email:@"bob@example.com"
                                                      phone:@"555-222-2222"
                                                      image:nil];
    ACPerson *personC = [[ACPerson alloc] initWithFirstname:@"Charlie"
                                                   lastName:@"C"
                                                      email:@"charles@example.com"
                                                      phone:@"555-333-3333"
                                                      image:nil];
    
        [ACPopulate populateGroupWithName:@"Test"
                              withPersons:@[personA, personB, personC]
                               completion:nil];
    
To add randomly-generated contacts instead, use a _ACPersonSet_:
    
        [ACPopulate populateGroupWithName:@"Test"
                       withCountOfPersons:10
                                  fromSet:[ACPersonSet personSetWithRandomNameAndImage]
                               completion:nil];
    
It is possible to populate with a custom _ACPersonSet_ by using data sets (_ACNameSet_ and _ACImageSet_). Here is an example of populating with random first names, common US surnames and [identicon](https://en.wikipedia.org/wiki/Identicon) avatars:

	[ACPopulate populateGroupWithName:@"Test"
                   withCountOfPersons:10
                              fromSet:[ACPersonSet setWithFirstNameSet:[ACNameSet randomNameSet]
                                                           lastNameSet:[ACNameSet commonSurnameSet]
                                                              imageSet:[ACImageSet identiconImageSet]
                           completion:nil];

Or you can supply multiple _ACPersonSet_, like a male and a female set:

	[ACPopulate populateGroupWithName:@"Test"
                   withCountOfPersons:10
                             fromSets:@[
                                        [ACPersonSet setWithFirstNameSet:[ACNameSet commonMaleNameSet]
                                                             lastNameSet:[ACNameSet commonSurnameSet]
                                                                imageSet:[ACImageSet maleFaceImageSet]],
                                                                         
                                        [ACPersonSet setWithFirstNameSet:[ACNameSet commonFemaleNameSet]
                                                             lastNameSet:[ACNameSet commonSurnameSet]
                                                                imageSet:[ACImageSet femaleFaceImageSet]]
                                        ]
                           completion:nil];
                        
                           

If you want to delete the _Test_ group and all its members from the addess book:

    [ACPopulate depopulateGroupWithName:@"Test" completion:nil];

You can also have a look at the _Populate_ app for inspiration.


#### Generating contacts

If you want to use randomly-generated contacts directly:

	ACPersonSet *personSet = [ACPersonSet setWithFirstNameSet:[ACNameSet randomNameSet]
                                                  lastNameSet:[ACNameSet commonSurnameSet]
                                                     imageSet:[ACImageSet identiconImageSet]];
	ACPerson *person = [personSet randomPerson];
    NSLog(@"%@", person.firstName);
	



## Documentation

If you have [appledoc](http://gentlebytes.com/appledoc/) installed, you can generate the documentation by running the corresponding target.
