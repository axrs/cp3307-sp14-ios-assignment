//
// Created by Alexander Scott on 22/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASCard.h"


/** Number Guessing Game Mode

Defines the skeletal structure for implementing a new game mode for use with the Number Guessing Game/

*/
@protocol ASGameMode <NSObject>


/**---------------------------------------------------------------------------------------
* @name setupForRangeFromTo
*  ---------------------------------------------------------------------------------------
*/

/** Sets up the Game Mode for a given range of values (inclusive)

@param minimumValue Lowest value in range
@param maximumValue Highest value in range

*/
- (void)setupForRangeFrom:(int)minimumValue To:(int)maximumValue;

/**---------------------------------------------------------------------------------------
* @name reset
*  ---------------------------------------------------------------------------------------
*/

/** Resets the game mode

*/
- (void)reset;

/**---------------------------------------------------------------------------------------
* @name valueIsSecret
*  ---------------------------------------------------------------------------------------
*/

/** Determines if the given value is the secret number

@return YES if correct
*/
- (BOOL)valueIsSecret:(int)value;


/**---------------------------------------------------------------------------------------
* @name userIsToGuess
*  ---------------------------------------------------------------------------------------
*/

/** Determines if the user is to guess a number

@return YES if user is required to guess the value
*/
- (BOOL)userIsToGuess;

/**---------------------------------------------------------------------------------------
* @name canViewPrevious
*  ---------------------------------------------------------------------------------------
*/

/** Determines if the user is able to view the previous shown card

@return YES if true
*/
- (BOOL)canViewPrevious;

/**---------------------------------------------------------------------------------------
* @name canViewNext
*  ---------------------------------------------------------------------------------------
*/

/** Determines if the user is able to view the next card

@return YES if true
*/
- (BOOL)canViewNext;

/**---------------------------------------------------------------------------------------
* @name showHints
*  ---------------------------------------------------------------------------------------
*/

/** Determines if the user is able to view hints for the cards

@return YES if true
*/
- (BOOL)showHints;

/**---------------------------------------------------------------------------------------
* @name isSecretOnCard
*  ---------------------------------------------------------------------------------------
*/

/** Determines if the secret value is on a specified card

@return YES if true
*/
- (BOOL)isSecretOnCard:(ASCard *)card;

/**---------------------------------------------------------------------------------------
* @name showHintForCard
*  ---------------------------------------------------------------------------------------
*/

/** Show a hint for the given card

@return YES if true
*/
- (BOOL)showHintForCard:(ASCard *)card;
@end