//
// Created by Alexander Scott on 26/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASSingleGameCore.h"


@implementation ASSingleGameCore {

}
static ASGameCore *_sharedInstance = nil;

static dispatch_once_t predicate;

+ (ASGameCore *)sharedInstance {
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ASGameCore alloc] initWithRangeFrom:1 To:10];
    });
    return _sharedInstance;
}

@end