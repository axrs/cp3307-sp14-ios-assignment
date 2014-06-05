//
// Created by Alexander Scott on 22/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <Foundation/Foundation.h>


/** Game Key Generator Strategy

Defines implementation methodology for assigning values to individual cards.

*/
@protocol ASGameKeyGenerator <NSObject>

/** Maximum value required to generate keys for
*/
@property(readwrite) int maximumValue;


/** Initialises the Generator with a given maximum range.

@param value Maximum value required to generate
@return Initialised Generator
*/
- (id)initWithMaximumValue:(int)value;


/**---------------------------------------------------------------------------------------
* @name setupForRangeFromTo
*  ---------------------------------------------------------------------------------------
*/

/** Sets up the Score Tracker for a given range of values (inclusive)

@param minimumValue Lowest value in range
@param maximumValue Highest value in range
*/
- (void)setupRangeFrom:(int)minimumValue To:(int)maximumValue;

/** Gets an array of keys required to generate the values.

@return Array of integer keys
*/
- (NSMutableArray *)generateKeys;
@end