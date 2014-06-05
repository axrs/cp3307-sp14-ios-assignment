//
// Created by Alexander Scott on 22/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASCard.h"


/** Basic representation of a Card containing a range of values

*/
@implementation ASCard {

}

/**---------------------------------------------------------------------------------------
* @name init
*  ---------------------------------------------------------------------------------------
*/

/** Initialises the Card without any values

@return Initialised Card object
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

/** Initialises the Card with a specified value

@return Initialised Card object with only the given value set
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

/** Adds a specified value to the card

@param value Value to add to the card
*/
- (void)addValue:(int)value {
    [[self values] addObject:[NSNumber numberWithInteger:value]];
}

/**---------------------------------------------------------------------------------------
* @name containsValue
*  ---------------------------------------------------------------------------------------
*/

/** Checks if the card contains a specified value

@param value Value to find
@return YES if card has the value
*/
- (BOOL)containsValue:(int)value {
    for (NSNumber *i in [self values]) {
        if ([i isEqualToNumber:[NSNumber numberWithInteger:value]]) {
            return YES;
        }
    }
    return NO;
}

@end