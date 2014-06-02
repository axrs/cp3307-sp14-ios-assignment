//
//  ASCardView.m
//  Number Guess
//
//  Created by Alexander Scott on 2/06/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASCardView.h"

@implementation ASCardView {
    CGRect _textBounds;
    CGFloat _fontSize;
    NSMutableDictionary *numberPaintAttributes;
}

const static int PADDING = 20;
const static int PREFERRED_RECT_WIDTH = 48;

@synthesize card = _card;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _textBounds = CGRectMake(0, 0, 0, 0);
        _fontSize = 12.0f;
        numberPaintAttributes = nil;
    }
    return self;
}


- (NSMutableDictionary *)paintAttributes {
    if (numberPaintAttributes == nil) {
        UIFont *font = [UIFont fontWithName:@"CMFreshPaint" size:_fontSize];

        NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        [style setAlignment:NSTextAlignmentCenter];

        numberPaintAttributes = [[NSMutableDictionary alloc] init];
        [numberPaintAttributes setObject:font forKey:NSFontAttributeName];
        [numberPaintAttributes removeObjectForKey:NSStrokeWidthAttributeName];
        [numberPaintAttributes removeObjectForKey:NSStrokeColorAttributeName];
        [numberPaintAttributes setObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];

        [numberPaintAttributes setObject:style forKey:NSParagraphStyleAttributeName];
    }
    return numberPaintAttributes;
}


- (void)setCard:(ASCard *)card {
    _card = card;
    [self calculateTextRectSize];
}

- (void)calculateTextRectSize {

    double values = [[[self card] values] count] + 0.0;

    int maxColumnsPerRow;
    int columns;
    int rows;
    double viewWidth = self.bounds.size.width - PADDING * 2;
    double viewHeight = self.bounds.size.height - PADDING * 2;

    maxColumnsPerRow = (int) ceil(viewWidth / PREFERRED_RECT_WIDTH);

    if (viewWidth > viewHeight) {
        maxColumnsPerRow = (int) (maxColumnsPerRow / (viewWidth / PREFERRED_RECT_WIDTH * 1.5));
    }

    columns = (int) ceil(values / maxColumnsPerRow);
    rows = (int) ceil(values / columns);

    _textBounds = CGRectMake(0, 0, (CGFloat) (viewWidth / columns), (CGFloat) (viewHeight / rows));
    _fontSize = (CGFloat) ((viewHeight / rows) * 0.7);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSString *text = @"Hello World!";

    int left = PADDING;
    int top = PADDING;

    CGFloat paintLeft;
    CGFloat paintTop;

    for (NSNumber *num in [[self card] values]) {
        paintLeft = left;
        paintTop = top;

        _textBounds.origin.x = paintLeft;
        _textBounds.origin.y = paintTop;

        NSString *value = [NSString stringWithFormat:@"%@", num];
        [value drawInRect:_textBounds withAttributes:[self paintAttributes]];

        left += _textBounds.size.width;

        if (left + _textBounds.size.width > self.bounds.size.width) {
            left = PADDING;
            top += _textBounds.size.height;
        }

    }

    //[text drawAtPoint:CGPointMake(10.0f, 20.0f) withAttributes:[self paintAttributes]];
    //[text drawInRect:rect withAttributes:[self paintAttributes]];
    // Drawing code

}

@end
