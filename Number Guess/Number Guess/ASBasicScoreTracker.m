//
// Created by Alexander Scott on 26/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASBasicScoreTracker.h"


@implementation ASBasicScoreTracker {
@private
    long _timeStart;
    int _range;
    long _score;
}

- (long)score {
    return _score;
}


- (void)setupForRangeFrom:(int)minimumValue To:(int)maximumValue {
    _range = (maximumValue - minimumValue) * 10000000;
    [self reset];
}

- (void)gameFinished {
    double now = [[NSDate date] timeIntervalSince1970];
    long timeEnd = (long) now * 1000;

    long gameDuration = timeEnd - _timeStart;

    _score = _range / gameDuration;
}

- (void)reset {
    double now = [[NSDate date] timeIntervalSince1970];
    _timeStart = (long) now * 1000;
}

- (BOOL)isTracked {
    return YES;
}


@end