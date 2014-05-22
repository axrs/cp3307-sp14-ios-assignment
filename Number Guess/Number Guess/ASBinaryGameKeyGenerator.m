//
// Created by Alexander Scott on 22/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASBinaryGameKeyGenerator.h"

/** Binary Key Generation Strategy

Key generation strategy for a finite sequence of positive integers for the binary number sequence.

*/
@implementation ASBinaryGameKeyGenerator {
@private
    int _maximumValue;
}


/** Initialises the generator with a maximum required value to generate

@param maximumValue Highest value required to generate
*/
- (id)initWithMaximumValue:(int)maximumValue {
    self = [super init];
    if (self) {
        _maximumValue = maximumValue;
    }

    return self;
}

/** Gets the current maximum generation value
*/
- (int)maximumValue {
    return _maximumValue;
}

/** Sets the maximum required generation value

@param maximumValue Highest value required to generate
*/
- (void)setMaximumValue:(int)maximumValue {
    if (maximumValue > 0) {
        _maximumValue = maximumValue;
    }
}

/** Generates the finite sequence of positive integers

@return array sequence of binary value
*/
- (NSMutableArray *)generateKeys {

    int runningSum = 0;

    int i = 1;

    NSMutableArray *keys = [[NSMutableArray alloc] init];

    while (runningSum <= [self maximumValue]) {
        [keys addObject:[NSNumber numberWithInteger:i]];
        runningSum += i;
        i += i;
    }
    return keys;
}

@end