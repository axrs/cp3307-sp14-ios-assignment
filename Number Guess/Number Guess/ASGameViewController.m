//
//  ASGameViewController.m
//  Number Guess
//
//  Created by Alexander Scott on 26/05/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASGameViewController.h"
#import "ASSingleGameCore.h"

@interface ASGameViewController ()

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
    } else if (viewCount >= [[[ASSingleGameCore sharedInstance] cards] count]) {
        [self setCardForView];
    } else {
        [self clearPreviousCardFromNavigationStack];
    }

}

- (void)resetGame {
    [[ASSingleGameCore sharedInstance] reset];
}

- (void)clearPreviousCardFromNavigationStack {
    //Remove the previous cards from the Navigation stack.
    NSMutableArray *navigationControllers = [[NSMutableArray alloc] initWithArray:self.navigationController.viewControllers];

    //The total number of controlers to parse = count - current view
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
    [[self hintButton] setHidden:showHint];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:
                         (id)sender {
    viewCount++;
    if ([[segue identifier] isEqualToString:@"GameCardSegue"] && viewCount >= [[[ASSingleGameCore sharedInstance] cards] count]) {
        //All cards seen, move on.
        viewCount = 0;

        UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"NumberGuessController"];
        [self.navigationController popToRootViewControllerAnimated:NO];
        [self.navigationController pushViewController:controller animated:YES];

    } else {
        [super prepareForSegue:segue sender:sender];
    }

}


- (IBAction)dismissView {
    [self.navigationController popViewControllerAnimated:YES];
    viewCount = 0;
}

- (IBAction)dismissToRoot {
    [self.navigationController popToRootViewControllerAnimated:YES];
    viewCount = 0;

}


@end
