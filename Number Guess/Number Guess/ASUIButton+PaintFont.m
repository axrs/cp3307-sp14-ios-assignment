//
//  ASUIButton+PaintFont.m
//  Number Guess
//
//  Created by Alexander Scott on 5/06/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASUIButton+PaintFont.h"
#import "ASTypeFaceFactory.h"

@implementation ASUIButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];

    CGFloat fontSize = [self titleLabel].font.pointSize;

    self.titleLabel.font = [[ASTypeFaceFactory defaultTypeFace] fontWithSize:fontSize];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
