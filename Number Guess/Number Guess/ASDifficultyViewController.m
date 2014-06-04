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

#if !defined(MAX)
      #define MAX(A,B)((A)>(B) ? (A) : (B));
#endif

#if !defined(MIN)
      #define MAX(A,B)((A)>(B) ? (A) : (B));
#endif

@interface ASDifficultyViewController () {
    int _minimum;
    int _lowerRangeMax;
    int _maximum;
    int _selectedMinimum;
    int _selectedMaximum;

}

@end

@implementation ASDifficultyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _minimum = 1;
    _lowerRangeMax = 20;
    _maximum = 100;
    _selectedMinimum = 1;
    _selectedMaximum = 2;
}

- (IBAction)easyDifficultySelection:(UIView *)sender {
    [[[ASEasyGameDifficultyCommand alloc] init] execute];
}

- (IBAction)mediumDifficultySelection:(UIView *)sender {
    [[[ASMediumGameDifficultyCommand alloc] init] execute];

}

- (IBAction)hardDifficultySelection:(UIView *)sender {
    [[[ASHardGameDifficultyCommand alloc] init] execute];

}


- (IBAction)customDifficultySelection:(UIView *)sender {
    ASCustomGameDifficultyCommand *cmd = [[ASCustomGameDifficultyCommand alloc] init];
    [cmd setMinimumValue:_selectedMinimum];
    [cmd setMaximumValue:_selectedMinimum];
    [cmd execute];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

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

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel *label = (UILabel *) view;

    if (label == nil) {
        label = [[UILabel alloc] init];
        [label setFont:[UIFont fontWithName:@"CMFreshPaint" size:20]];
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
