//
//  ASUIButton+PaintFont.m
//  Number Guess
//
//  Created by Alexander Scott on 26/05/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASUIButton+PaintFont.h"
#import "ASTypeFaceFactory.h"


/** UIButton sub-class pre-configured to use a default app wide (non-system) font

*/
@implementation ASUIButton


/**---------------------------------------------------------------------------------------
* @name awakeFromNib
*  ---------------------------------------------------------------------------------------
*/

/** Configures the UIButton instance to use the default app font prior to display

*/
- (void)awakeFromNib {
    [super awakeFromNib];

    CGFloat fontSize = [self titleLabel].font.pointSize;

    self.titleLabel.font = [[ASTypeFaceFactory defaultTypeFace] fontWithSize:fontSize];
}
@end
