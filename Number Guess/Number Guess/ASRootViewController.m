//
// Created by Alexander Scott on 26/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASRootViewController.h"


@implementation ASRootViewController {

}
- (IBAction)unwindToRoot:(UIStoryboardSegue *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end