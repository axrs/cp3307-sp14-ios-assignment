//
//  ASUserGuessViewController.h
//  Number Guess
//
//  Created by Alexander Scott on 2/06/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASUserGuessViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
- (IBAction)dismissToRoot;

- (IBAction)submitGuess;
@end
