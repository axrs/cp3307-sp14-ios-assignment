//
// Created by Alexander Scott on 26/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASHomeViewController.h"

@implementation ASHomeViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)unwindToRoot:(UIStoryboardSegue *)sender {
    //Kill all other view controllers to get here
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end