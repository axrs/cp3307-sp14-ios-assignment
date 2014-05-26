//
// Created by Alexander Scott on 26/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASGameCore.h"
#import "ASBinaryGameKeyGenerator.h"
#import "ASStandardGameMode.h"
#import "ASBasicScoreTracker.h"

@implementation ASGameCore {
@private
    id <ASGameKeyGenerator> _generator;
    id <ASGameMode> _mode;
    id <ASGameScoreTracker> _tracker;
    int _minimumValue, _maximumValue;
    NSMutableArray *_keys;
    NSMutableArray *_cards;
}


- (id)initWithRangeFrom:(int)minimumValue To:(int)maximumValue {
    self = [super init];

    if (self) {
        _minimumValue = minimumValue;
        _maximumValue = maximumValue;
    }

    return self;
}

- (id <ASGameKeyGenerator>)keyGenerator {
    if (_generator == nil) {
        _generator = [[ASBinaryGameKeyGenerator alloc] init];
    }
    return _generator;
}

- (void)setKeyGenerator:(id <ASGameKeyGenerator>)keyGenerator {
    _generator = keyGenerator;
}

- (id <ASGameMode>)gameMode {
    if (_mode == nil) {
        _mode = [[ASStandardGameMode alloc] init];
    }
    return _mode;
}

- (void)setGameMode:(id <ASGameMode>)gameMode {
    _mode = gameMode;
}

- (id <ASGameScoreTracker>)tracker {
    if (_tracker == nil) {
        _tracker = [[ASBasicScoreTracker alloc] init];
    }
    return _tracker;
}

- (void)setTracker:(id <ASGameScoreTracker>)tracker {
    _tracker = tracker;
}

- (int)minimumValue {
    return _minimumValue;
}

- (void)setMinimumValue:(int)minimumValue {
    _minimumValue = minimumValue;
}

- (int)maximumValue {
    return _maximumValue;
}

- (void)setMaximumValue:(int)maximumValue {
    _maximumValue = maximumValue;
}

- (long)score {
    return [[self tracker] score];
}

- (void)reset {
    [[self gameMode] setupForRangeFrom:_minimumValue To:_maximumValue];
    [[self tracker] setupForRangeFrom:_minimumValue To:_maximumValue];
    [[self keyGenerator] setupRangeFrom:_minimumValue To:_maximumValue];
    _keys = nil;
    _cards = nil;
}

- (void)finished {
    [[self tracker] gameFinished];
}

- (NSMutableArray *)keys {
    if (_keys == nil) {
        _keys = [[self keyGenerator] generateKeys];
    }
    return _keys;
}

- (NSMutableArray *)cards {
    if (_cards == nil) {
        _cards = [[NSMutableArray alloc] init];
        [self generateCards];
    }
    return _cards;
}

- (void)addValueToCard:(int)value atIndex:(int)index {
    ASCard *c;

    if ([[self cards] count] > index) {
        c = [[self cards] objectAtIndex:index];
        [c addValue:value];
    } else {
        c = [[ASCard alloc] initWithValue:value];
        [[self cards] addObject:c];
    }
}

- (void)generateCards {
    int valueToFind;
    int currentKey;

    for (int i = _minimumValue; i <= _maximumValue; i++) {

        valueToFind = i;

        for (int j = [_keys count] - 1; j >= 0; j--) {
            currentKey = [[[self keys] objectAtIndex:j] intValue];

            if (valueToFind >= currentKey) {
                [self addValueToCard:i atIndex:j];
                valueToFind -= currentKey;
            }

        }
    }
}

@end