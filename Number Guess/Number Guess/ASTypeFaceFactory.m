//
// Created by Alexander Scott on 26/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASTypeFaceFactory.h"


@implementation ASTypeFaceFactory {

}

static UIFont *wetPaintFont;

+ (UIFont *)defaultTypeFace {
    if (wetPaintFont == nil) {
        wetPaintFont = [UIFont fontWithName:@"CMFreshPaint" size:15.0f];
    }
    return wetPaintFont;
}

@end