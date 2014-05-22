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
*/
- (id)initWithMaximumValue:(int)value;

/** Gets an array of keys required to generate the values.

@return Array of integer keys
*/
- (NSMutableArray *)generateKeys;
@end