//
//  ASRangePickerData.h
//  Number Guess
//
//  Created by Alexander Scott on 5/06/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASRangePickerData : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>

- (int)selectedMaximum;

- (int)selectedMinimum;
@end
