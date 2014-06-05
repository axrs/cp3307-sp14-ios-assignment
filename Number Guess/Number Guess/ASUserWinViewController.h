//
//  ASUserWinViewController.h
//  Number Guess
//
//  Created by Alexander Scott on 26/05/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASUserWinViewController : UIViewController <UITextFieldDelegate>

@property(nonatomic, weak) IBOutlet UITextField *nameField;
@property(nonatomic, weak) IBOutlet UILabel *scoreLabel;

- (IBAction)dismissToRoot;

- (IBAction)submitScore;

@end
