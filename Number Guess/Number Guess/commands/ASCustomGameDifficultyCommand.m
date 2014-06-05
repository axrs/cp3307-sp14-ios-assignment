//
// Created by Alexander Scott on 26/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASCustomGameDifficultyCommand.h"
#import "ASSingleGameCore.h"


/** Custom Game Difficulty Selection Command

*/
@implementation ASCustomGameDifficultyCommand {
@private
    int _minimumValue;
    int _maximumValue;
}


/**---------------------------------------------------------------------------------------
* @name init
*  ---------------------------------------------------------------------------------------
*/

/** Initialises a Custom Difficulty Command with a default range of 1 to 100 inclusive.

*/
- (id)init {
    self = [super init];
    if (self) {
        _maximumValue = 100;
        _minimumValue = 1;
    }
    return self;
}


/**---------------------------------------------------------------------------------------
* @name setMinimumValue
*  ---------------------------------------------------------------------------------------
*/

/** Sets the minimum possible value (inclusive) for the game to be configured to.

@param value Lowest inclusive range value
*/
- (void)setMinimumValue:(int)value; {
    _minimumValue = value;
}

/**---------------------------------------------------------------------------------------
* @name setMaximumValue
*  ---------------------------------------------------------------------------------------
*/

/** Sets the maximum possible value (inclusive) for the game to be configured to.

@param value Highest inclusive range value
*/

- (void)setMaximumValue:(int)value; {
    _maximumValue = value;
}

/**---------------------------------------------------------------------------------------
* @name execute
*  ---------------------------------------------------------------------------------------
*/

/** Executes the command configuring the game difficulty to the defined range

*/

- (void)execute {
    ASGameCore *instance = [ASSingleGameCore sharedInstance];
    [instance setMaximumValue:_maximumValue];
    [instance setMinimumValue:_minimumValue];
}

@end