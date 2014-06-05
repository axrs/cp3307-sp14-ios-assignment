//
//  ASGameViewController.m
//  Number Guess
//
//  Created by Alexander Scott on 26/05/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASGameViewController.h"
#import "ASSingleGameCore.h"
#import "ASRootNavigationController.h"

/** Game View Controller

Controls how the interaction between cards is to be achieved while adhering to the defined Game Mode regulations
*/
@interface ASGameViewController () {

}

@end

@implementation ASGameViewController
static int viewCount;

/**---------------------------------------------------------------------------------------
* @name viewDidLoad
*  ---------------------------------------------------------------------------------------
*/

/** Configures the interface for the user after loading.  Showing and removing hints as required
*/
- (void)viewDidLoad {
    [super viewDidLoad];

    if (viewCount == 0) {
        [self resetGame];
        [self setInGame:YES];
    } else {
        [self clearPreviousCardFromNavigationStack];
    }

    if (viewCount <= [[[ASSingleGameCore sharedInstance] cards] count]) {
        [self setCardForView];
    }

    if (viewCount == [[[ASSingleGameCore sharedInstance] cards] count] - 1) {
        [[self nextCardButton] setBackgroundImage:[UIImage imageNamed:@"sign_question.png"] forState:UIControlStateNormal];
    }

}
/**---------------------------------------------------------------------------------------
* @name resetGame
*  ---------------------------------------------------------------------------------------
*/

/** Resets the game to begin a new round
*/
- (void)resetGame {
    [[ASSingleGameCore sharedInstance] reset];
}

/**---------------------------------------------------------------------------------------
* @name clearPreviousCardFromNavigationStack
*  ---------------------------------------------------------------------------------------
*/

/** Clears any previously viewed Game Cards from the navigation stack, allowing popping to
return to an option controller.
*/
- (void)clearPreviousCardFromNavigationStack {
    //Remove the previous cards from the Navigation stack.
    NSMutableArray *navigationControllers = [[NSMutableArray alloc] initWithArray:self.navigationController.viewControllers];

    //The total number of controllers to parse = count - current view
    int index = [navigationControllers count] - 2;
    for (index; index > 0; index--) {

        for (NSObject *controller in navigationControllers) {
            if ([self isKindOfClass:[controller class]]) {
                [navigationControllers removeObjectAtIndex:(NSUInteger) index];
            }
        }

    }
    [self.navigationController setViewControllers:navigationControllers animated:NO];
}


/**---------------------------------------------------------------------------------------
* @name setCardForView
*  ---------------------------------------------------------------------------------------
*/
/** Sets the selected card to be viewed as the reference for rendering within the sub view

*/
- (void)setCardForView {
    ASGameCore *core = [ASSingleGameCore sharedInstance];
    ASCard *card = [[core cards] objectAtIndex:(NSUInteger) viewCount];
    BOOL showHint = [[core gameMode] showHintForCard:card];

    [[self cardView] setCard:card];
    [[self hintButton] setHidden:!showHint];
}

/**---------------------------------------------------------------------------------------
* @name setIsInGame
*  ---------------------------------------------------------------------------------------
*/

/** Notifies the root view controller that a game is presently in progress or not
@param isInGame YES if a game is currently being played
*/
- (void)setInGame:(BOOL)isInGame {
    if ([self.navigationController isKindOfClass:[ASRootNavigationController class]]) {
        ASRootNavigationController *controller = (ASRootNavigationController *) self.navigationController;
        [controller setIsInGame:isInGame];
    }
}

/**---------------------------------------------------------------------------------------
* @name shouldPerformSegueWithIdentifier sender
*  ---------------------------------------------------------------------------------------
*/

/** Determines if requested segue should be performed, overriding it if the game is
supposed to have ended

@param identify Segue Storyboard Identifier
@param sender NSObject requesting the segue
@return YES if the segue can be performed
*/
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {

    if ([identifier isEqualToString:@"GameCardSegue"] && viewCount < [[[ASSingleGameCore sharedInstance] cards] count] - 1) {
        //Game is still going. Allow showing next card
        viewCount++;
        return YES;
    } else if (viewCount == [[[ASSingleGameCore sharedInstance] cards] count] - 1) {
        //All cards seen, move on.
        viewCount = 0;
        [self setInGame:NO];
        [[ASSingleGameCore sharedInstance] finished];
        [self performSegueWithIdentifier:@"UserGuessSegue" sender:self];
        return NO;
    }
    return [identifier isEqualToString:@"UserGuessSegue"];
}


/**---------------------------------------------------------------------------------------
* @name dismissView
*  ---------------------------------------------------------------------------------------
*/

/** Dismisses the current Game Card, returning to the previous View Controller

@return IBAction
*/
- (IBAction)dismissView {
    [self.navigationController popViewControllerAnimated:YES];
    viewCount = 0;
    [self setInGame:NO];
}

/**---------------------------------------------------------------------------------------
* @name dismissToRoot
*  ---------------------------------------------------------------------------------------
*/

/** Dismisses the current Game Card back to the root view/home screen

@return IBAction
*/
- (IBAction)dismissToRoot {
    [self.navigationController popToRootViewControllerAnimated:YES];
    viewCount = 0;
    [self setInGame:NO];
}


@end
