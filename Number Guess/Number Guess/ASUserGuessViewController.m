//
//  ASUserGuessViewController.m
//  Number Guess
//
//  Created by Alexander Scott on 2/06/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASUserGuessViewController.h"
#import "ASSingleGameCore.h"

@interface ASUserGuessViewController () {
    UIFont *_font;
}

@end

@implementation ASUserGuessViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissToRoot {
    [self.navigationController popToRootViewControllerAnimated:NO];
}


- (IBAction)playAgain {

}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    ASGameCore *core = [ASSingleGameCore sharedInstance];
    int range = [core maximumValue] - [core minimumValue];
    return range + 1;
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

    ASGameCore *core = [ASSingleGameCore sharedInstance];
    int value = [core minimumValue] + row;

    label.text = [NSString stringWithFormat:@"%d", value];
    return label;
}


@end
