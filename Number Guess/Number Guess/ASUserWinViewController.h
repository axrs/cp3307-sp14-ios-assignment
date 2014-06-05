//
//  ASUserWinViewController.h
//  Number Guess
//
//  Created by Alexander Scott on 5/06/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASUserWinViewController : UIViewController <UITextFieldDelegate>

@property(nonatomic, weak) IBOutlet UITextField *nameField;
@property(nonatomic, weak) IBOutlet UILabel *scoreLabel;

- (IBAction)dismissToRoot;

@end
