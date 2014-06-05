//
//  ASHighScoreViewController.m
//  Number Guess
//
//  Created by Alexander Scott on 26/05/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASHighScoreViewController.h"
#import "ASHighScoreDAO.h"
#import "HighScore.h"

/**
High Score View Controller determines how the user can interact with the High Scores
managed by the persistent storage
*/
@interface ASHighScoreViewController () {
    NSArray *_scores;
}

@end

@implementation ASHighScoreViewController

/**---------------------------------------------------------------------------------------
* @name viewWillAppear
*  ---------------------------------------------------------------------------------------
*/

/** Gets a current list of scores from storage and forces a table reload
@param animated YES if the view is to be animated by the core controller
*/
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    _scores = [[ASHighScoreDAO sharedInstance] all];
    [[self scoresView] reloadData];
}

/**---------------------------------------------------------------------------------------
* @name dismissToRoot
*  ---------------------------------------------------------------------------------------
*/

/** Dismisses the current Game Card back to the root view/home screen

@return IBAction
*/
- (IBAction)dismissToRoot {
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - Table View Delegate and DataSource

/**---------------------------------------------------------------------------------------
* @name numberOfSectionsInTableView
*  ---------------------------------------------------------------------------------------
*/

/** Determines how many sections are to be displayed in the table

@param tableView Table displaying the data
@return Number of required sections
*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

/**---------------------------------------------------------------------------------------
* @name tableView numberOfRowsInSection
*  ---------------------------------------------------------------------------------------
*/

/** Determines how many rows are to be displayed in the given table and section

@param tableView Table displaying the data
@param section Relevant section
@return Number of rows for required section
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_scores count];
}
/**---------------------------------------------------------------------------------------
* @name tableView cellForRowAtIndexPath
*  ---------------------------------------------------------------------------------------
*/

/** Determines how display the table cell for at a given index path

@param tableView Table displaying the data
@param indexPath Path to table cell indicating section and row
@return Configured UITableViewCell
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HighScoresCell" forIndexPath:indexPath];

    HighScore *result = [_scores objectAtIndex:indexPath.row];

    UILabel *label;

    label = (UILabel *) [cell viewWithTag:1];
    label.text = [NSString stringWithFormat:@"%@", result.name];

    label = (UILabel *) [cell viewWithTag:2];
    label.text = [NSString stringWithFormat:@"%@", result.score];
    return cell;
}


@end
