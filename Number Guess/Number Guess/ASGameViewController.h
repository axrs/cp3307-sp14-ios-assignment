//
//  ASGameViewController.h
//  Number Guess
//
//  Created by Alexander Scott on 26/05/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASCardView.h"

@interface ASGameViewController : UIViewController
@property(weak, nonatomic) IBOutlet ASCardView *cardView;
@property(weak, nonatomic) IBOutlet UIButton *hintButton;
@property(weak, nonatomic) IBOutlet UIButton *nextCardButton;

- (IBAction)dismissView;

- (IBAction)dismissToRoot;

@end
