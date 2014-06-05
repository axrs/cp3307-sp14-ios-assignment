//
//  ASUserLostViewController.m
//  Number Guess
//
//  Created by Alexander Scott on 26/05/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASUserLostViewController.h"

@interface ASUserLostViewController ()

@end

@implementation ASUserLostViewController


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

@end
