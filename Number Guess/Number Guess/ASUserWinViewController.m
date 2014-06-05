//
//  ASUserWinViewController.m
//  Number Guess
//
//  Created by Alexander Scott on 5/06/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASUserWinViewController.h"
#import "ASSingleGameCore.h"

@interface ASUserWinViewController ()

@end

@implementation ASUserWinViewController
static NSString *_userName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (NSString *)userName {
    if (_userName == nil) {
        _userName = [[NSString alloc] init];
    }
    return _userName;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (IBAction)dismissToRoot {
    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (void)viewDidLoad {
    ASGameCore *core = [ASSingleGameCore sharedInstance];

    [[self scoreLabel] setText:[NSString stringWithFormat:@"%ld", [core score]]];
    [[self nameField] setText:[self userName]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
