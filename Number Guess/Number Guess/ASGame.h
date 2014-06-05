//
// Created by Alexander Scott on 26/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASGameKeyGenerator.h"
#import "ASGameScoreTracker.h"
#import "ASGameMode.h"

@protocol ASGame

/** Game Key Generator Strategy used to determine how to placed values to cards
*/
@property(readwrite) id <ASGameKeyGenerator> keyGenerator;

/** Game Mode Strategy providing rules and regulations on how the game is to be played
*/
@property(readwrite) id <ASGameMode> gameMode;

/** Score Tracker implementation controlling how a score is tracked over each game
*/
@property(readwrite) id <ASGameScoreTracker> tracker;

/** Minimum (lower range) value to display on cards
*/
@property(readwrite) int minimumValue;

/** Maximum (higher range) value to display on cards
*/
@property(readwrite) int maximumValue;

/**---------------------------------------------------------------------------------------
* @name initWithRangeFrom To
*  ---------------------------------------------------------------------------------------
*/

/** Initialises the game to use a specified range of values

@param minimumValue Lowest value (inclusive) for the game to use
@param maximumValue Highest value (inclusive) for the game to use
@return Initialised Game Object
*/
- (id)initWithRangeFrom:(int)minimumValue To:(int)maximumValue;

/**---------------------------------------------------------------------------------------
* @name score
*  ---------------------------------------------------------------------------------------
*/

/** Gets the current games score

@return Current game score
*/
- (long)score;

/**---------------------------------------------------------------------------------------
* @name reset
*  ---------------------------------------------------------------------------------------
*/

/** Resets the current game instance (forcing a new game)
*/
- (void)reset;

/**---------------------------------------------------------------------------------------
* @name finished
*  ---------------------------------------------------------------------------------------
*/

/** Indicates the game is to end
*/
- (void)finished;

/**---------------------------------------------------------------------------------------
* @name keys
*  ---------------------------------------------------------------------------------------
*/

/** Gets an array of key values used to generate the cards

@return An array of keys
*/
- (NSMutableArray *)keys;

/**---------------------------------------------------------------------------------------
* @name cards
*  ---------------------------------------------------------------------------------------
*/

/** Gets an array of cards generated for the game range using the generated keys

@return An array of cards
*/
- (NSMutableArray *)cards;

/**---------------------------------------------------------------------------------------
* @name addValueToCard atIndex
*  ---------------------------------------------------------------------------------------
*/

/** Adds a specified value to a card object at a given index

@param value Value to add to the card
@param index Card index with the array in which to add the value
*/
- (void)addValueToCard:(int)value atIndex:(int)index;

@end