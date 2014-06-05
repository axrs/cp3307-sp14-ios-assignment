//
//  ASUserGuessViewController.m
//  Number Guess
//
//  Created by Alexander Scott on 2/06/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASUserGuessViewController.h"
#import "ASSingleGameCore.h"
#import "ASTypeFaceFactory.h"

@interface ASUserGuessViewController () {
    int _selected;
    int _minimum;
    int _maximum;
}

@end

@implementation ASUserGuessViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}


- (void)viewDidLoad {
    ASGameCore *core = [ASSingleGameCore sharedInstance];
    _selected = [core minimumValue];
    _minimum = [core minimumValue];
    _maximum = [core maximumValue];
}


- (IBAction)dismissToRoot {
    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _maximum - _minimum + 1;
}

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


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    _selected = _minimum + row;
}


- (IBAction)submitGuess {
    ASGameCore *core = [ASSingleGameCore sharedInstance];
    if ([[core gameMode] valueIsSecret:_selected]) {
        [self performSegueWithIdentifier:@"UserWinSegue" sender:self];
    } else {
        [self performSegueWithIdentifier:@"UserLostSegue" sender:self];
    }
}


@end
