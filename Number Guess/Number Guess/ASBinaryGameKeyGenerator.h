//
// Created by Alexander Scott on 22/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASGameKeyGenerator.h"

@interface ASBinaryGameKeyGenerator : NSObject <ASGameKeyGenerator>
- (instancetype)initWithMaximumValue:(int)maximumValue;

@end