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

@interface ASGameViewController () {

}

@end

@implementation ASGameViewController
static int viewCount;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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

- (void)resetGame {
    [[ASSingleGameCore sharedInstance] reset];
}

- (void)clearPreviousCardFromNavigationStack {
    //Remove the previous cards from the Navigation stack.
    NSMutableArray *navigationControllers = [[NSMutableArray alloc] initWithArray:self.navigationController.viewControllers];

    //The total number of controllers to parse = count - current view
    int index = [navigationControllers count] - 2;
    for (index; index > 0; index--) {

        NSObject *controller = [navigationControllers objectAtIndex:index];
        if ([self isKindOfClass:[controller class]]) {
            [navigationControllers removeObjectAtIndex:index];
        }
    }
    [self.navigationController setViewControllers:navigationControllers animated:NO];
}

- (void)setCardForView {
    ASGameCore *core = [ASSingleGameCore sharedInstance];
    ASCard *card = [[core cards] objectAtIndex:viewCount];
    BOOL showHint = [[core gameMode] showHintForCard:card];

    [[self cardView] setCard:card];
    [[self hintButton] setHidden:!showHint];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setInGame:(BOOL)isInGame {
    if ([self.navigationController isKindOfClass:[ASRootNavigationController class]]) {
        ASRootNavigationController *controller = (ASRootNavigationController *) self.navigationController;
        [controller setIsInGame:isInGame];
    }
}

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


- (IBAction)dismissView {
    [self.navigationController popViewControllerAnimated:YES];
    viewCount = 0;
    [self setInGame:NO];
    NSLog(@"Dismiss");
}

- (IBAction)dismissToRoot {
    [self.navigationController popToRootViewControllerAnimated:YES];
    viewCount = 0;
    [self setInGame:NO];
    NSLog(@"Dismiss Root");

}


@end
