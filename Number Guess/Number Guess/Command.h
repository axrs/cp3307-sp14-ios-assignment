//
// Created by Alexander Scott on 26/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
* Executable Command Protocol for separating parcelable logic from controllers
*/
@protocol Command <NSObject>
- (void)execute;
@end