//
// Created by Alexander Scott on 26/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASEasyGameDifficultyCommand.h"
#import "ASSingleGameCore.h"

@implementation ASEasyGameDifficultyCommand {

}

- (void)execute {
    ASGameCore *instance = [ASSingleGameCore sharedInstance];
    [instance setMinimumValue:1];
    [instance setMaximumValue:10];
}

@end