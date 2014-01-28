//
//  ACPopulateViewController.m
//  Populate
//
//  Created by Arnaud Coomans on 27/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "ACPopulateViewController.h"
#import "PopulateKit.h"

static const NSInteger ACPopulateViewControllerMaxCountOfPersons = 10000;


@interface ACPopulateViewController ()
@end

@implementation ACPopulateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.countOfPersonsStepper.value = [self.countOfPersonsTextField.text doubleValue];
}


#pragma mark - actions

- (IBAction)populateButtonDidTouchUpInside:(id)sender {
    
    self.populateButton.enabled = NO;
    
    [ACPopulate populateGroupWithName:self.groupNameTextField.text
                   withCountOfPersons:[self.countOfPersonsTextField.text integerValue]
                             fromSets:@[
                                        [ACPersonSet setWithFirstNameSet:[ACNameSet commonMaleNameSet]
                                                             lastNameSet:[ACNameSet commonSurnameSet]
                                                                imageSet:[ACImageSet maleFaceImageSet]],
                                        
                                        [ACPersonSet setWithFirstNameSet:[ACNameSet commonFemaleNameSet]
                                                             lastNameSet:[ACNameSet commonSurnameSet]
                                                                imageSet:[ACImageSet femaleFaceImageSet]]
                                        ]
                           completion:^{
                               self.populateButton.enabled = YES;
                           }];
}

- (IBAction)depopulateButtonDidTouchUpInside:(id)sender {
    [[[UIAlertView alloc] initWithTitle:@"Depopulate"
                                  message:[NSString stringWithFormat:@"Remove group \"%@\" and all its contacts?", self.groupNameTextField.text]
                                 delegate:self
                        cancelButtonTitle:@"Cancel"
                        otherButtonTitles:@"Ok", nil] show];
}

- (IBAction)countOfPersonsStepperValueDidChange:(id)sender {
    self.countOfPersonsTextField.text = [NSString stringWithFormat:@"%i", MIN((int)self.countOfPersonsStepper.value, ACPopulateViewControllerMaxCountOfPersons)];
}

- (IBAction)contactsButtonAction:(id)sender {
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

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField == self.countOfPersonsTextField) {
        NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        self.countOfPersonsStepper.value = MIN([newString integerValue], ACPopulateViewControllerMaxCountOfPersons);
        self.countOfPersonsTextField.text = [NSString stringWithFormat:@"%i", (int)self.countOfPersonsStepper.value];
        return NO;
    }
    return YES;
}



@end
