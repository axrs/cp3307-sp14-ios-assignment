//
// Created by Alexander Scott on 26/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASMediumGameDifficultyCommand.h"
#import "ASSingleGameCore.h"

/**
* Medium Game Difficulty Configuration Command
*/
@implementation ASMediumGameDifficultyCommand {

}


/**---------------------------------------------------------------------------------------
* @name execute
*  ---------------------------------------------------------------------------------------
*/

/** Executes the command configuring the game difficulty to an medium difficulty (moderate
    range of values)

*/
- (void)execute {
    ASGameCore *instance = [ASSingleGameCore sharedInstance];

    [instance setMinimumValue:1];
    [instance setMaximumValue:20];

}

@end