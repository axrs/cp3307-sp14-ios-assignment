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

@interface ASHighScoreViewController () {
    NSArray *_scores;
}

@end

@implementation ASHighScoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    _scores = [[ASHighScoreDAO sharedInstance] all];
    [[self scoresView] reloadData];
}


- (IBAction)dismissToRoot {
    [self.navigationController popViewControllerAnimated:YES];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_scores count];
}

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
