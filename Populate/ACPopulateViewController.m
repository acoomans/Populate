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

static NSString * const ACPopulateViewControllerGroupNameKey = @"groupName";
static NSString * const ACPopulateViewControllerCountOfPersonsKey = @"countOfPersons";
static NSString * const ACPopulateViewControllerNameTypeKey = @"nameType";
static NSString * const ACPopulateViewControllerImageTypeKey = @"imageType";


NS_ENUM(NSInteger, ACPopulateViewControllerNameType) {
    ACPopulateViewControllerNameTypeRandom = 0,
    ACPopulateViewControllerNameTypeReal = 1,
};

NS_ENUM(NSInteger, ACPopulateViewControllerImageType) {
    ACPopulateViewControllerImageTypeColor = 0,
    ACPopulateViewControllerImageTypeIdenticon = 1,
    ACPopulateViewControllerImageTypeFace = 2,
};

@interface ACPopulateViewController ()
@end

@implementation ACPopulateViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.groupNameTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:ACPopulateViewControllerGroupNameKey] ?: self.groupNameTextField.text;
    self.countOfPersonsTextField.text = [[[NSUserDefaults standardUserDefaults] objectForKey:ACPopulateViewControllerCountOfPersonsKey] stringValue] ?: self.countOfPersonsTextField.text;
    self.nameSegmentedControl.selectedSegmentIndex = [([[NSUserDefaults standardUserDefaults] objectForKey:ACPopulateViewControllerNameTypeKey] ?: @(self.nameSegmentedControl.selectedSegmentIndex)) integerValue];
    self.imageSegmentedControl.selectedSegmentIndex = [([[NSUserDefaults standardUserDefaults] objectForKey:ACPopulateViewControllerImageTypeKey] ?: @(self.imageSegmentedControl.selectedSegmentIndex)) integerValue];
    
    self.countOfPersonsStepper.value = [self.countOfPersonsTextField.text doubleValue];
}


#pragma mark - actions

- (IBAction)populateButtonDidTouchUpInside:(id)sender {
    
    ACNameSet *maleNameSet = nil;
    ACNameSet *femaleNameSet = nil;
    ACNameSet *surnameSet = nil;
    
    ACImageSet *maleImageSet = nil;
    ACImageSet *femaleImageSet = nil;
    
    switch (self.nameSegmentedControl.selectedSegmentIndex) {
        case ACPopulateViewControllerNameTypeRandom:
            surnameSet = maleNameSet = femaleNameSet = [ACNameSet randomNameSet];
            break;
            
        case ACPopulateViewControllerNameTypeReal:
        default:
            maleNameSet = [ACNameSet commonMaleNameSet];
            femaleNameSet = [ACNameSet commonFemaleNameSet];
            surnameSet = [ACNameSet commonSurnameSet];
            break;
    }
    
    switch (self.imageSegmentedControl.selectedSegmentIndex) {
        case ACPopulateViewControllerImageTypeColor:
            maleImageSet = femaleImageSet = [ACImageSet randomColorImageSet];
            break;
        
        case ACPopulateViewControllerImageTypeFace:
            maleImageSet = [ACImageSet maleFaceImageSet];
            femaleImageSet = [ACImageSet femaleFaceImageSet];
            break;
            
        case ACPopulateViewControllerImageTypeIdenticon:
        default:
            maleImageSet = femaleImageSet = [ACImageSet identiconImageSet];
            break;
    }
    
    self.populateButton.enabled = NO;
    
    [ACPopulate populateGroupWithName:self.groupNameTextField.text
                   withCountOfPersons:[self.countOfPersonsTextField.text integerValue]
                             fromSets:@[
                                        [ACPersonSet setWithFirstNameSet:maleNameSet
                                                             lastNameSet:surnameSet
                                                                imageSet:maleImageSet],
                                        
                                        [ACPersonSet setWithFirstNameSet:femaleNameSet
                                                             lastNameSet:surnameSet
                                                                imageSet:femaleImageSet]
                                        ]
                           completion:^{
                               self.populateButton.enabled = YES;
                           }];
    
    
    [[NSUserDefaults standardUserDefaults] setObject:self.groupNameTextField.text forKey:ACPopulateViewControllerGroupNameKey];
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:[self.countOfPersonsTextField.text integerValue]] forKey:ACPopulateViewControllerCountOfPersonsKey];
    [[NSUserDefaults standardUserDefaults] setObject:@(self.nameSegmentedControl.selectedSegmentIndex) forKey:ACPopulateViewControllerNameTypeKey];
    [[NSUserDefaults standardUserDefaults] setObject:@(self.imageSegmentedControl.selectedSegmentIndex) forKey:ACPopulateViewControllerImageTypeKey];
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

- (IBAction)deleteAllContactsButtonAction:(id)sender {

    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"This will delete all contacts in the address book. Are you sure you want to continue?"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:@"Delete all contacts"
                                                    otherButtonTitles:nil];

    [actionSheet showInView:self.view];
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


#pragma mark - UIAlertViewDelegate

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {

    if (buttonIndex == 0) {
        CFErrorRef error = NULL;

        ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, &error);

        ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error) {
            CFArrayRef allPeopleRef = ABAddressBookCopyArrayOfAllPeople(addressBookRef);

            for (CFIndex i = 0; i < CFArrayGetCount(allPeopleRef); i++) {
                ABRecordRef personRef = CFArrayGetValueAtIndex(allPeopleRef, i);
                ABAddressBookRemoveRecord(addressBookRef, personRef, &error);
            }

            ABAddressBookSave(addressBookRef, &error);
            CFRelease(allPeopleRef);
            CFRelease(addressBookRef);
        });
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
