//
//  ASDifficultyViewController.h
//  Number Guess
//
//  Created by Alexander Scott on 26/05/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASDifficultyViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

- (IBAction)unwindToDifficultySelection:(UIStoryboardSegue *)sender;

- (IBAction)easyDifficultySelection:(UIView *)sender;

- (IBAction)mediumDifficultySelection:(UIView *)sender;

- (IBAction)hardDifficultySelection:(UIView *)sender;

- (IBAction)customDifficultySelection:(UIView *)sender;

@end
