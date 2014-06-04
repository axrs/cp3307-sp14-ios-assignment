//
//  ASRangePickerData.m
//  Number Guess
//
//  Created by Alexander Scott on 5/06/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASRangePickerData.h"

@implementation ASRangePickerData {
    int _lowerRangeMax;
    int _maximum;
    int _selectedMinimum;
    int _selectedMaximum;
}

- (id)init {
    self = [super init];
    if (self) {
        _lowerRangeMax = 20;
        _maximum = 100;
        _selectedMinimum = 1;
        _selectedMaximum = 2;
    }

    return self;
}

- (int)selectedMaximum {
    return _selectedMaximum;
}

- (int)selectedMinimum {
    return _selectedMinimum;
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
