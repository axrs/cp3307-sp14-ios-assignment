//
//  ASUserWinViewController.m
//  Number Guess
//
//  Created by Alexander Scott on 26/05/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASUserWinViewController.h"
#import "ASSingleGameCore.h"
#import "ASHighScoreDAO.h"

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


+ (NSString *)userName {
    if (_userName == nil) {
        _userName = [[NSString alloc] init];
    }
    return _userName;
}

+ (void)setUserName:(NSString *)name {
    _userName = name;
}

- (BOOL)textFieldShouldReturn:(UITextField *)sender {
    [sender resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)dismissToRoot {
    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (void)viewDidLoad {
    ASGameCore *core = [ASSingleGameCore sharedInstance];

    [[self scoreLabel] setText:[NSString stringWithFormat:@"%ld", [core score]]];
    [[self nameField] setText:[ASUserWinViewController userName]];
}

- (IBAction)submitScore {
    [ASUserWinViewController setUserName:[[self nameField] text]];

    if (![[ASUserWinViewController userName] isEqualToString:@""]) {
        [[ASHighScoreDAO sharedInstance] createHighScoreFor:[ASUserWinViewController userName]
                                                  WithScore:[[ASSingleGameCore sharedInstance] score]];
        [self.navigationController popToRootViewControllerAnimated:NO];
    }

}


@end
