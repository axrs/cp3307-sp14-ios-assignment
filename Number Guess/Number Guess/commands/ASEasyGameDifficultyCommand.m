//
// Created by Alexander Scott on 26/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASEasyGameDifficultyCommand.h"
#import "ASSingleGameCore.h"

/** Easy Game Difficulty Configuration Command

*/
@implementation ASEasyGameDifficultyCommand {

}

/**---------------------------------------------------------------------------------------
* @name execute
*  ---------------------------------------------------------------------------------------
*/

/** Executes the command configuring the game difficulty to an easy difficulty (low range
    of values)

*/
- (void)execute {
    ASGameCore *instance = [ASSingleGameCore sharedInstance];
    [instance setMinimumValue:1];
    [instance setMaximumValue:10];
}

@end