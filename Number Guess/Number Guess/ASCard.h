//
// Created by Alexander Scott on 22/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ASCard : NSObject

@property(strong, nonatomic) NSMutableArray *values;

- (id)initWithValue:(int)value;


- (void)addValue:(int)value;

- (BOOL)containsValue:(int)value;

@end