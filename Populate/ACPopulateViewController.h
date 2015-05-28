//
//  ACPopulateViewController.h
//  Populate
//
//  Created by Arnaud Coomans on 27/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>

@interface ACPopulateViewController : UIViewController <UIActionSheetDelegate, UIAlertViewDelegate, ABPeoplePickerNavigationControllerDelegate, UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *groupNameTextField;

@property (nonatomic, weak) IBOutlet UITextField *countOfPersonsTextField;
@property (nonatomic, weak) IBOutlet UIStepper *countOfPersonsStepper;

@property (nonatomic, weak) IBOutlet UISegmentedControl *nameSegmentedControl;
@property (nonatomic, weak) IBOutlet UISegmentedControl *imageSegmentedControl;

@property (nonatomic, weak) IBOutlet UIButton *populateButton;
@property (nonatomic, weak) IBOutlet UIButton *depopulateButton;

@end
