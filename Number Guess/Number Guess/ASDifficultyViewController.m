//
//  ASDifficultyViewController.m
//  Number Guess
//
//  Created by Alexander Scott on 26/05/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASDifficultyViewController.h"
#import "ASEasyGameDifficultyCommand.h"
#import "ASMediumGameDifficultyCommand.h"
#import "ASHardGameDifficultyCommand.h"
#import "ASCustomGameDifficultyCommand.h"
#import "ASTypeFaceFactory.h"


/** Game Difficulty Configuration Controller

Supporting a selection of predefined difficulties or a user defined range using a UIPickerView
*/
@interface ASDifficultyViewController () {
    int _lowerRangeMax;
    int _maximum;
    int _selectedMinimum;
    int _selectedMaximum;
}
@end

@implementation ASDifficultyViewController

/**---------------------------------------------------------------------------------------
* @name viewDidLoad
*  ---------------------------------------------------------------------------------------
*/

/** Initialises custom difficulty restrictions once the view has loaded

*/
- (void)viewDidLoad {
    [super viewDidLoad];
    _lowerRangeMax = 20;
    _maximum = 100;
    _selectedMinimum = 1;
    _selectedMaximum = 2;
}

/**---------------------------------------------------------------------------------------
* @name easyDifficultySelection
*  ---------------------------------------------------------------------------------------
*/

/** Sets the game difficulty to easy

@param sender Calling UIView Object
@return IBAction entry point
*/
- (IBAction)easyDifficultySelection:(UIView *)sender {
    [[[ASEasyGameDifficultyCommand alloc] init] execute];
}

/**---------------------------------------------------------------------------------------
* @name mediumDifficultySelection
*  ---------------------------------------------------------------------------------------
*/

/** Sets the game difficulty to medium

@param sender Calling UIView Object
@return IBAction entry point
*/
- (IBAction)mediumDifficultySelection:(UIView *)sender {
    [[[ASMediumGameDifficultyCommand alloc] init] execute];
}

/**---------------------------------------------------------------------------------------
* @name hardDifficultySelection
*  ---------------------------------------------------------------------------------------
*/

/** Sets the game difficulty to hard

@param sender Calling UIView Object
@return IBAction entry point
*/
- (IBAction)hardDifficultySelection:(UIView *)sender {
    [[[ASHardGameDifficultyCommand alloc] init] execute];
}

/**---------------------------------------------------------------------------------------
* @name customDifficultySelection
*  ---------------------------------------------------------------------------------------
*/

/** Sets the game difficulty to custom range using updated instance variables

@param sender Calling UIView Object
@return IBAction entry point
*/
- (IBAction)customDifficultySelection:(UIView *)sender {
    ASCustomGameDifficultyCommand *cmd = [[ASCustomGameDifficultyCommand alloc] init];
    [cmd setMinimumValue:_selectedMinimum];
    [cmd setMaximumValue:_selectedMaximum];
    [cmd execute];
}

/**---------------------------------------------------------------------------------------
  * @name numberOfComponentsInPickerView
  *  ---------------------------------------------------------------------------------------
  */

/** Gets the intended number of components to be displayed within the custom range picker

@param pickerView Picker View to determine which data source to use
@return Two components, lower bound and upper bound
*/
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
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
    switch (component) {
        case 0:
            return _lowerRangeMax;
        case 1:
            return _maximum - _selectedMinimum;
        default:
            return 0;
    }
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


    int value = 0;

    switch (component) {
        case 0:
            value = row + 1;
            break;
        case 1:
            value = _selectedMinimum + row + 1;
            break;
        default:
            break;
    }

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
    switch (component) {
        case 0:
            _selectedMinimum = row + 1;
            [pickerView reloadComponent:1];
            [self pickerView:pickerView didSelectRow:[pickerView selectedRowInComponent:1] inComponent:1];
            break;
        case 1:
            _selectedMaximum = _selectedMinimum + row + 1;
            break;
        default:
            break;
    }
}


@end
