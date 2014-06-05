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

/**
User has won view controller determines how to ask for the users name
for scoring purposes
*/
@interface ASUserWinViewController ()

@end

@implementation ASUserWinViewController
static NSString *_userName;

/**---------------------------------------------------------------------------------------
* @name userName
*  ---------------------------------------------------------------------------------------
*/

/** Gets the previously used name from last game session
@return UserName or empty string
*/
+ (NSString *)userName {
    if (_userName == nil) {
        _userName = [[NSString alloc] init];
    }
    return _userName;
}

/**---------------------------------------------------------------------------------------
* @name setUserName
*  ---------------------------------------------------------------------------------------
*/

/** Sets the user name for next game win session
*/
+ (void)setUserName:(NSString *)name {
    _userName = name;
}


/**---------------------------------------------------------------------------------------
* @name textFieldShouldReturn
*  ---------------------------------------------------------------------------------------
*/

/** Resigns all keyboards on the sending object
@param sender UITextField object requesting resignation
@return YES after resigned
*/
- (BOOL)textFieldShouldReturn:(UITextField *)sender {
    [sender resignFirstResponder];
    return YES;
}

/**---------------------------------------------------------------------------------------
* @name touchesBegan withEvent
*  ---------------------------------------------------------------------------------------
*/

/** Resigns all keyboards on view tap
@param touches Touch object containing information about total and locations
@param event Touch event type
*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
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
* @name viewDidLoad
*  ---------------------------------------------------------------------------------------
*/

/** Configures the interface for the user after loading.
*/
- (void)viewDidLoad {
    ASGameCore *core = [ASSingleGameCore sharedInstance];

    [[self scoreLabel] setText:[NSString stringWithFormat:@"%ld", [core score]]];
    [[self nameField] setText:[ASUserWinViewController userName]];
}

/**---------------------------------------------------------------------------------------
* @name submitScore
*  ---------------------------------------------------------------------------------------
*/

/** Attempts to submit the score with the persistent storage and return home

@return IBAction
*/
- (IBAction)submitScore {
    [ASUserWinViewController setUserName:[[self nameField] text]];

    if (![[ASUserWinViewController userName] isEqualToString:@""]) {
        [[ASHighScoreDAO sharedInstance] createHighScoreFor:[ASUserWinViewController userName]
                                                  WithScore:[[ASSingleGameCore sharedInstance] score]];
        [self.navigationController popToRootViewControllerAnimated:NO];
    }

}


@end
