//
// Created by Alexander Scott on 22/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASCard.h"

/** Generic representation of a Card with values

*/

@implementation ASCard {

}

/**---------------------------------------------------------------------------------------
* @name init
*  ---------------------------------------------------------------------------------------
*/

/** Initialises a newly allocated Card with no values

@return A Card
*/
- (id)init {
    self = [super init];

    if (self) {
        _values = [[NSMutableArray alloc] init];
    }

    return self;
}

/**---------------------------------------------------------------------------------------
* @name initWithValue
*  ---------------------------------------------------------------------------------------
*/

/** Initialises a newly allocated Card with containing a given integer value

@param value Initial value on the Card
@return A Card
*/
- (id)initWithValue:(int)value {
    self = [super init];

    if (self) {
        _values = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInteger:value], nil];
    }

    return self;
}

/**---------------------------------------------------------------------------------------
* @name addValue
*  ---------------------------------------------------------------------------------------
*/

/** Adds a given integer value to the card

@param value Value to add to the card
*/
- (void)addValue:(int)value {
    [[self values] addObject:[NSNumber numberWithInteger:value]];
}

/**---------------------------------------------------------------------------------------
* @name containsValue
*  ---------------------------------------------------------------------------------------
*/

/** Determines if the Card has the given value

@param value Value to find
@return YES if Card has the value
*/
- (BOOL)containsValue:(int)value {
    for (NSNumber *i in [self values]) {
        if (i == [NSNumber numberWithInteger:value]) {
            return YES;
        }
    }
    return NO;
}

@end