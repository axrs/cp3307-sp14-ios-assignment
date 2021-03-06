//
// Created by Alexander Scott on 22/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASStandardGameMode.h"


/** Standard Guessing Game Mode

Defines the standard methodology to play the number guessing game
*/
@implementation ASStandardGameMode {
@private
    int _minimumValue;
    int _maximumValue;
    int _secret;
}

- (void)setupForRangeFrom:(int)minimumValue To:(int)maximumValue {
    _minimumValue = minimumValue;
    _maximumValue = maximumValue;
    [self reset];
}

/**---------------------------------------------------------------------------------------
* @name reset
*  ---------------------------------------------------------------------------------------
*/

/** Resets the game mode generating a new secret value

*/
- (void)reset {
    _secret = arc4random() % (_maximumValue - _minimumValue) + _minimumValue;
}

- (int)secret {
    return _secret;
}

- (BOOL)valueIsSecret:(int)value {
    return (_secret == value);
}

- (BOOL)userIsToGuess {
    return YES;
}

- (BOOL)canViewPrevious {
    return NO;
}

- (BOOL)canViewNext {
    return YES;
}

- (BOOL)showHints {
    return YES;
}

- (BOOL)isSecretOnCard:(ASCard *)card {
    return [card containsValue:_secret];
}

- (BOOL)showHintForCard:(ASCard *)card {
    return [self showHints] && [self isSecretOnCard:card];
}

@end