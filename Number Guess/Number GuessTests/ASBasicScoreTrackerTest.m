//
//  ASBasicScoreTrackerTest.m
//  Number Guess
//
//  Created by Alexander Scott on 22/05/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ASBasicScoreTracker.h"

@interface ASBasicScoreTrackerTest : XCTestCase
@end

@implementation ASBasicScoreTrackerTest {
    ASBasicScoreTracker *t;

}

- (void)setUp {
    [super setUp];
    t = [[ASBasicScoreTracker alloc] init];
    [t setupForRangeFrom:1 To:100];
}

- (void)tearDown {
    t = nil;
    [super tearDown];
}


- (void)testInit {
    XCTAssertEqual(0, [t score]);
    XCTAssertTrue([t isTracked]);
}

- (void)testGameFinished {
    [t gameFinished];
    XCTAssertTrue([t score] > 0);
}


@end
