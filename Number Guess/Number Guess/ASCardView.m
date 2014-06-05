//
//  ASCardView.m
//  Number Guess
//
//  Created by Alexander Scott on 26/05/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import "ASCardView.h"

/** Graphically represents a Card object (values) within the constrained view bounds
adhering to a calculated grid system.  Displayed values are rendered using the default
app font.
*/
@implementation ASCardView {
    CGRect _textBounds;
    CGFloat _fontSize;
    NSMutableDictionary *numberPaintAttributes;
}

const static int PADDING = 20;
const static int PREFERRED_RECT_WIDTH = 48;

@synthesize card = _card;


/**---------------------------------------------------------------------------------------
* @name initWithFrame
*  ---------------------------------------------------------------------------------------
*/

/** Initialises the card view defining the overall edge to edge dimensions

@param frame
@return Initialised Card View
*/

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _textBounds = CGRectMake(0, 0, 0, 0);
        _fontSize = 12.0f;
        numberPaintAttributes = nil;
    }
    return self;
}


/**---------------------------------------------------------------------------------------
* @name paintAttributes
*  ---------------------------------------------------------------------------------------
*/

/** Gets paint attributes for the rendering individual card values

@return Text rendering options configured for this card view instance
*/
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



/**---------------------------------------------------------------------------------------
* @name setCard
*  ---------------------------------------------------------------------------------------
*/

/** Sets a reference to the Card for the view to display

@param card Card instance to render
*/
- (void)setCard:(ASCard *)card {
    _card = card;
    [self calculateTextRectSize];
}


/**---------------------------------------------------------------------------------------
* @name calculatesTextRectSize
*  ---------------------------------------------------------------------------------------
*/

/** Calculates a maximum bounds for each card value to render within

*/
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
    _fontSize = (CGFloat) ((viewHeight / rows) * 0.5);
}

/**---------------------------------------------------------------------------------------
* @name drawRect
*  ---------------------------------------------------------------------------------------
*/

/** Renders the card values within the specified region
*
@param rect Renderable extent to draw within
*/
- (void)drawRect:(CGRect)rect {
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
}

@end