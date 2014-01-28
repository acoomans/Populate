# Populate

Populate is both an app and a library to easily add random-generated contacts to the iOS address book.

[![Build Status](https://api.travis-ci.org/acoomans/Populate.png)](https://api.travis-ci.org/acoomans/Populate.png)
[![Cocoapods](https://cocoapod-badges.herokuapp.com/v/Populate/badge.png)](http://beta.cocoapods.org/?q=on%3Aios%20name%3APopulate%2A)
[![Cocoapods](https://cocoapod-badges.herokuapp.com/p/Populate/badge.png)](http://beta.cocoapods.org/?q=on%3Aios%20name%3APopulate%2A)


## Populate app

### Run the app

1. Build and run.
2. Choose a group name (useful for later deletion)
3. Choose number of fake contacts
4. Tap "populate" to add the contacts
5. Tap "depopulate" to remove the group and all its member contacts

** Be careful not to erase your real contact if you use Populate on a real device **

## PopulateKit library

### Install

You can either clone this repository and add the files in the _PopulateKit_ directory to your project; or use [CocoaPods](http://cocoapods.org).

Add a pod entry to your Podfile:

    pod 'PopulateKit', '~> 0.0.2'

Install the pod(s) by running:

    pod install


### Usage

Import the header

	#import "PopulateKit.h"

To add custom-made contacts to the address book, create the contacts with the _ACPerson_ wrapper and add them to _Test_ group in the address book:

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
    
    [ACPopulate populateGroupWithName:@"Test" withPersons:@[personA, personB, personC] completion:nil];
    
To add randomly-generated contacts instead, use a _ACPersonSet_:
    
    [ACPopulate populateGroupWithName:@"Test" withCountOfPersons:10 fromSet:[ACPersonSet personSetWithRandomNameAndImage] completion:nil];

If you want to delete the _Test_ group and all its members:

    [ACPopulate depopulateGroupWithName:@"Test" completion:nil];

You can also have a look at the _Populate_ app for inspiration.


## Documentation

If you have [appledoc](http://gentlebytes.com/appledoc/) installed, you can generate the documentation by running the corresponding target.
