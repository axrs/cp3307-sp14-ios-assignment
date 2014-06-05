//
// Created by Alexander Scott on 26/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASHomeViewController.h"

/** Home View Controller

First view controller displayed to the user on app launch

*/
@implementation ASHomeViewController {

}

/**---------------------------------------------------------------------------------------
* @name unwindToRoot
*  ---------------------------------------------------------------------------------------
*/

/** Dismisses the current Game Card back to the root view/home screen

@param sender UIStoryboardSegue requesting a return to the home view
@return IBAction
*/
- (IBAction)unwindToRoot:(UIStoryboardSegue *)sender {
    //Kill all other view controllers to get here
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end