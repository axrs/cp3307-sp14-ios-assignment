//
// Created by Alexander Scott on 26/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASGameKeyGenerator.h"
#import "ASGameScoreTracker.h"
#import "ASGameMode.h"

@protocol ASGame

@property(readwrite) id <ASGameKeyGenerator> keyGenerator;

@property(readwrite) id <ASGameMode> gameMode;

@property(readwrite) id <ASGameScoreTracker> tracker;

@property(readwrite) int minimumValue;

@property(readwrite) int maximumValue;

- (id)initWithRangeFrom:(int)minimumValue To:(int)maximumValue;

- (long)score;

- (void)reset;

- (void)finished;

- (NSMutableArray *)keys;

- (NSMutableArray *)cards;

- (void)addValueToCard:(int)value atIndex:(int)index;

@end