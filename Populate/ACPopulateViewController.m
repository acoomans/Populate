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
    [[[Populate alloc] init] populateGroupWithName:self.groupNameTextField.text
                                withCountOfPersons:[self.countOfPersonsTextField.text integerValue]
                                           fromSet:[ACPersonSet personSetWithRandomNameAndImage]];
}

- (IBAction)depopulate:(id)sender {
    
    [[[UIAlertView alloc] initWithTitle:@"Depopulate"
                                  message:[NSString stringWithFormat:@"Remove group \"%@\" and all its contacts?", self.groupNameTextField.text]
                                 delegate:self
                        cancelButtonTitle:@"Cancel"
                        otherButtonTitles:@"Ok", nil] show];
}


#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (buttonIndex) {
        case 0:
            break;
            
        case 1:
            [[[Populate alloc] init] depopulateGroupWithName:self.groupNameTextField.text];
            break;
            
        default:
            break;
    }
}

@end
