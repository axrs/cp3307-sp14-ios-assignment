//
//  ASUILabel+PaintFont.m
//  Number Guess
//
//  Created by Alexander Scott on 26/05/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASUILabel+PaintFont.h"
#import "ASTypeFaceFactory.h"

/** UILabel sub-class pre-configured to use a default app wide (non-system) font

*/
@implementation ASUILabel

/**---------------------------------------------------------------------------------------
* @name awakeFromNib
*  ---------------------------------------------------------------------------------------
*/

/** Configures the UILabel instance to use the default app font prior to display

*/
- (void)awakeFromNib {
    [super awakeFromNib];
    CGFloat fontSize = self.font.pointSize;

    self.font = [[ASTypeFaceFactory defaultTypeFace] fontWithSize:fontSize];
}
@end
