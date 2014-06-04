//
//  ASRootNavigationController.m
//  Number Guess
//
//  Created by Alexander Scott on 2/06/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASRootNavigationController.h"
#import "OldStyleNavigationControllerAnimatedTransition.h"

@interface ASRootNavigationController ()

@end

@implementation ASRootNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    //Set the UINavigationControllerDelegate to self
    self.delegate = self;
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {

    //Restore iOS6 style sliding animation to allow use of clear background in application views.
    OldStyleNavigationControllerAnimatedTransition *anim = [[OldStyleNavigationControllerAnimatedTransition alloc] init];
    anim.operation = operation;
    return anim;
}


@end