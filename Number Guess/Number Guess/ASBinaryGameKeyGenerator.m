//
// Created by Alexander Scott on 22/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASBinaryGameKeyGenerator.h"


@implementation ASBinaryGameKeyGenerator {
@private
    int _maximumValue;
}

- (id)initWithMaximumValue:(int)maximumValue {
    self = [super init];
    if (self) {
        _maximumValue = maximumValue;
    }

    return self;
}

- (int)maximumValue {
    return _maximumValue;
}

- (void)setMaximumValue:(int)maximumValue {
    if (maximumValue > 0) {
        _maximumValue = maximumValue;
    }
}

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