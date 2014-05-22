//
// Created by Alexander Scott on 22/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ASGameScoreTracker <NSObject>

- (void)setupForRangeFrom:(int)minimumValue
                       To:(int)maximumValue;

-(void)gameFinished;
-(void)reset;
@end