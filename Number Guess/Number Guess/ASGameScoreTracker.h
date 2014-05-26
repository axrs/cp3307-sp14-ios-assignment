//
// Created by Alexander Scott on 22/05/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <Foundation/Foundation.h>


/** Score Tracking Skeletal Protocol

Used to implement various methods of game score tracking

*/
@protocol ASGameScoreTracker <NSObject>

/** Game Score (Calculated at end of Game);
*/
@property(readonly) long score;


/**---------------------------------------------------------------------------------------
* @name setupForRangeFromTo
*  ---------------------------------------------------------------------------------------
*/

/** Sets up the Score Tracker for a given range of values (inclusive)

@param minimumValue Lowest value in range
@param maximumValue Highest value in range

*/
- (void)setupForRangeFrom:(int)minimumValue
                       To:(int)maximumValue;

/**---------------------------------------------------------------------------------------
* @name gameFinished
*  ---------------------------------------------------------------------------------------
*/

/** Notifies the tracker that the game has finished

*/
- (void)gameFinished;

/**---------------------------------------------------------------------------------------
* @name reset
*  ---------------------------------------------------------------------------------------
*/

/** Resets the score tracker

*/
- (void)reset;


/**---------------------------------------------------------------------------------------
* @name isTracked
*  ---------------------------------------------------------------------------------------
*/

/** Checks to see if score tracking is being used by the implementation

@return YES if tracking enabled
*/
- (BOOL)isTracked;
@end