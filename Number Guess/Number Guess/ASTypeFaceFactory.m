//
// Created by Alexander Scott on 26/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASTypeFaceFactory.h"


/** Application TypeFace Font Factory
Gets instances of UIFont configured for application specific (non system standard) UIFonts
*/
@implementation ASTypeFaceFactory {

}

static UIFont *wetPaintFont;


/**---------------------------------------------------------------------------------------
* @name defaultTypeFace
*  ---------------------------------------------------------------------------------------
*/

/** Gets the default type face font to be used by the app

@return Configured UIFont (font size may required additional adjusting)
*/
+ (UIFont *)defaultTypeFace {
    if (wetPaintFont == nil) {
        wetPaintFont = [UIFont fontWithName:@"CMFreshPaint" size:15.0f];
    }
    return wetPaintFont;
}

@end