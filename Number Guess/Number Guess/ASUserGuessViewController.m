//
//  ASUserGuessViewController.m
//  Number Guess
//
//  Created by Alexander Scott on 26/05/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASUserGuessViewController.h"
#import "ASSingleGameCore.h"
#import "ASTypeFaceFactory.h"

/**
User Guess View Controller overlooks how the user is able to select a value to use as their
guess for the previous played game round
*/
@interface ASUserGuessViewController () {
    int _selected;
    int _minimum;
    int _maximum;
}

@end

@implementation ASUserGuessViewController

/**---------------------------------------------------------------------------------------
* @name viewDidLoad
*  ---------------------------------------------------------------------------------------
*/

/** Initialises the PickerView data source after the view as loaded

*/

- (void)viewDidLoad {
    ASGameCore *core = [ASSingleGameCore sharedInstance];
    _selected = [core minimumValue];
    _minimum = [core minimumValue];
    _maximum = [core maximumValue];
}

/**---------------------------------------------------------------------------------------
* @name dismissToRoot
*  ---------------------------------------------------------------------------------------
*/

/** Dismisses the current Game Card back to the root view/home screen

@return IBAction
*/
- (IBAction)dismissToRoot {
    [self.navigationController popToRootViewControllerAnimated:NO];
}

/**---------------------------------------------------------------------------------------
* @name numberOfComponentsInPickerView
*  ---------------------------------------------------------------------------------------
*/

/** Gets the intended number of components to be displayed within the custom range picker

@param pickerView Picker View to determine which data source to use
@return One component, range of values used in the game
*/
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

/**---------------------------------------------------------------------------------------
* @name pickerView numberOfRowsInComponent
*  ---------------------------------------------------------------------------------------
*/

/** Gets the intended number of rows to be displayed within the specified component of the
picker view

@param pickerView Picker View to determine which data source to use
@param component Component to determine the rows
@return Number of rows required
*/
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _maximum - _minimum + 1;
}


/**---------------------------------------------------------------------------------------
* @name pickerView viewForRow forComponent reusingView
*  ---------------------------------------------------------------------------------------
*/

/** Gets an individual Picker View Row UIView object for the specified component

@param pickerView Picker View to determine which data source to use
@param row Index for the component row
@param component Index for the data source column
@param view Existing UIView object to recycle saving memory
@return UIView for the target row
*/
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel *label = (UILabel *) view;

    if (label == nil) {
        label = [[UILabel alloc] init];
        [label setFont:[ASTypeFaceFactory defaultTypeFace]];
        [label setTextColor:[UIColor whiteColor]];
        [label setShadowColor:[UIColor blackColor]];
        [label setShadowOffset:CGSizeMake(1, 1)];
        [label setTextAlignment:NSTextAlignmentCenter];
    }

    int value = _minimum + row;

    label.text = [NSString stringWithFormat:@"%d", value];
    return label;
}

/**---------------------------------------------------------------------------------------
* @name pickerView didSelectRow forComponent inComponent
*  ---------------------------------------------------------------------------------------
*/

/** PickerView Event to notify the  controller that a row selection was made within a given
component index.

@param pickerView Picker View to determine which data source to use
@param row Recently selected row index
@param component Data source column index the row belongs to
*/
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    _selected = _minimum + row;
}


/**---------------------------------------------------------------------------------------
* @name submitGuess
*  ---------------------------------------------------------------------------------------
*/

/** Performs a submit action, determining if the users guess input is correct.  Triggering
a segue to the relevant destination.

@return IBAction
*/
- (IBAction)submitGuess {
    ASGameCore *core = [ASSingleGameCore sharedInstance];
    if ([[core gameMode] valueIsSecret:_selected]) {
        [self performSegueWithIdentifier:@"UserWinSegue" sender:self];
    } else {
        [self performSegueWithIdentifier:@"UserLostSegue" sender:self];
    }
}


@end
