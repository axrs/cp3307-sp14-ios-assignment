//
// Created by Alexander Scott on 26/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASHardGameDifficultyCommand.h"

#import "ASSingleGameCore.h"

/** Hard Game Difficulty Configuration Command

*/
@implementation ASHardGameDifficultyCommand {

}

/**---------------------------------------------------------------------------------------
* @name execute
*  ---------------------------------------------------------------------------------------
*/

/** Executes the command configuring the game difficulty to an hard difficulty (high range
of values)

*/
- (void)execute {
    ASGameCore *instance = [ASSingleGameCore sharedInstance];
    [instance setMinimumValue:1];
    [instance setMaximumValue:50];
}

@end