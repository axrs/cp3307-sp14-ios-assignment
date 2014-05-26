//
// Created by Alexander Scott on 26/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Command.h"

@interface ASCustomGameDifficultyCommand : NSObject <Command>

- (void)setMinimumValue:(int)value;

- (void)setMaximumValue:(int)value;

@end