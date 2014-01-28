//
//  ACPopulateViewController.m
//  Populate
//
//  Created by Arnaud Coomans on 27/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "ACPopulateViewController.h"
#import "PopulateKit.h"

@interface ACPopulateViewController ()
@end

@implementation ACPopulateViewController


#pragma mark - actions

- (IBAction)populate:(id)sender {
    
    self.populateButton.enabled = NO;
    
    [ACPopulate populateGroupWithName:self.groupNameTextField.text
                   withCountOfPersons:[self.countOfPersonsTextField.text integerValue]
                             fromSets:@[
                                        [[ACPersonSet alloc] initWithFirstNameSet:[ACNameSet commonMaleNameSet]
                                                                      lastNameSet:[ACNameSet commonSurnameSet]
                                                                         imageSet:[ACImageSet maleFaceImageSet]],
                                        [[ACPersonSet alloc] initWithFirstNameSet:[ACNameSet commonFemaleNameSet]
                                                                      lastNameSet:[ACNameSet commonSurnameSet]
                                                                         imageSet:[ACImageSet femaleFaceImageSet]]
                                        ]
                           completion:^{
                               self.populateButton.enabled = YES;
                           }];
}

- (IBAction)depopulate:(id)sender {
    [[[UIAlertView alloc] initWithTitle:@"Depopulate"
                                  message:[NSString stringWithFormat:@"Remove group \"%@\" and all its contacts?", self.groupNameTextField.text]
                                 delegate:self
                        cancelButtonTitle:@"Cancel"
                        otherButtonTitles:@"Ok", nil] show];
}

- (IBAction)contacts:(id)sender {
    ABPeoplePickerNavigationController *peoplePickerNavigationController = [[ABPeoplePickerNavigationController alloc] init];
    peoplePickerNavigationController.peoplePickerDelegate = self;
    [self presentViewController:peoplePickerNavigationController animated:YES completion:nil];
}


#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    self.depopulateButton.enabled = NO;
    
    switch (buttonIndex) {
        case 0: {
            break;
        }
            
        case 1: {
            [ACPopulate depopulateGroupWithName:self.groupNameTextField.text completion:^{
                self.depopulateButton.enabled = YES;
            }];
            break;
        }
            
        default:
            break;
    }
}

#pragma mark - ABPeoplePickerNavigationControllerDelegate

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person {
    return YES;
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person
                                property:(ABPropertyID)property
                              identifier:(ABMultiValueIdentifier)identifier {
    return YES;
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
