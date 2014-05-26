//
// Created by Alexander Scott on 26/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASSlideSegue.h"
#import "QuartzCore/QuartzCore.h"

@implementation ASSlideSegue {

}

- (void)perform {
    NSLog(@"Performing Custom Segue.");
    UIViewController *source = (UIViewController *) [self sourceViewController];
    UIViewController *destination = (UIViewController *) [self destinationViewController];

    CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    CATransition *transition = [CATransition animation];
    [transition setDuration:.25];
    [transition setTimingFunction:timingFunction];
    [transition setType:kCATransitionPush];
    [transition setSubtype:kCATransitionFromRight];

    [source.navigationController.view.layer addAnimation:transition
                                                  forKey:kCATransition];

    [source.navigationController pushViewController:destination
                                           animated:NO];
}

@end