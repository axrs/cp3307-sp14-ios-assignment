//
// Created by Alexander Scott on 26/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASCustomGameDifficultyCommand.h"
#import "ASSingleGameCore.h"

@implementation ASCustomGameDifficultyCommand {
@private
    int _minimumValue;
    int _maximumValue;
}


- (id)init {
    self = [super init];
    if (self) {
        _maximumValue = 100;
        _minimumValue = 1;
    }
    return self;
}


- (void)setMinimumValue:(int)value; {
    _maximumValue = value;
}

- (void)setMaximumValue:(int)value; {
    _maximumValue = value;
}

- (void)execute {
    ASGameCore *instance = [ASSingleGameCore sharedInstance];
    [instance setMaximumValue:_maximumValue];
    [instance setMinimumValue:_minimumValue];
}

@end