//
//  ASHighScoreViewController.h
//  Number Guess
//
//  Created by Alexander Scott on 26/05/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASHighScoreViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>


@property(weak, nonatomic) IBOutlet UITableView *scoresView;

- (IBAction)dismissToRoot;
@end
