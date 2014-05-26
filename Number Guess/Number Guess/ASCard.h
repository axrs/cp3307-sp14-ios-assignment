//
// Created by Alexander Scott on 22/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Generic representation of a Card with values

*/
@interface ASCard : NSObject

@property(strong, nonatomic) NSMutableArray *values;

/**---------------------------------------------------------------------------------------
* @name init
*  ---------------------------------------------------------------------------------------
*/

/** Initialises a newly allocated Card with no values

@return A Card
*/
- (id)init;

/**---------------------------------------------------------------------------------------
* @name initWithValue
*  ---------------------------------------------------------------------------------------
*/

/** Initialises a newly allocated Card with containing a given integer value

@param value Initial value on the Card
@return A Card
*/
- (id)initWithValue:(int)value;

/**---------------------------------------------------------------------------------------
* @name addValue
*  ---------------------------------------------------------------------------------------
*/

/** Adds a given integer value to the card

@param value Value to add to the card
*/
- (void)addValue:(int)value;

/**---------------------------------------------------------------------------------------
* @name containsValue
*  ---------------------------------------------------------------------------------------
*/

/** Determines if the Card has the given value

@param value Value to find
@return YES if Card has the value
*/
- (BOOL)containsValue:(int)value;

@end