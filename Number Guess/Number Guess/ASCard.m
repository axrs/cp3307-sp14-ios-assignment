//
// Created by Alexander Scott on 22/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASCard.h"


@implementation ASCard {

}

- (id)init {
    self = [super init];

    if (self) {
        _values = [[NSMutableArray alloc] init];
    }

    return self;
}


- (id)initWithValue:(int)value {
    self = [super init];

    if (self) {
        _values = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInteger:value], nil];
    }

    return self;
}


- (void)addValue:(int)value {
    [[self values] addObject:[NSNumber numberWithInteger:value]];
}


- (BOOL)containsValue:(int)value {
    for (NSNumber *i in [self values]) {
        if (i == [NSNumber numberWithInteger:value]) {
            return YES;
        }
    }
    return NO;
}

@end