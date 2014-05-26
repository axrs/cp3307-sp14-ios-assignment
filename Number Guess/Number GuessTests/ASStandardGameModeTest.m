//
//  ASStandardGameModeTest.m
//  Number Guess
//
//  Created by Alexander Scott on 26/05/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ASStandardGameMode.h"

@interface ASStandardGameModeTest : XCTestCase
@end

@implementation ASStandardGameModeTest {
    ASStandardGameMode *mode;

    int _min;
    int _max;
}

- (void)setUp {
    [super setUp];
    _min = 1;
    _max = 100;
    mode = [[ASStandardGameMode alloc] init];
    [mode setupForRangeFrom:_min To:_max];
}

- (void)tearDown {
    mode = nil;
    [super tearDown];
}


- (void)testInit {
    XCTAssertTrue([mode userIsToGuess]);
    XCTAssertTrue([mode canViewNext]);
    XCTAssertFalse([mode canViewPrevious]);
    XCTAssertTrue([mode showHints]);
}

- (void)testRandomValuesThroughReset {
    int secret;

    for (int i = 0; i < 10; i++) {
        [mode reset];
        secret = [mode secret];
        XCTAssertTrue((secret <= _max && secret >= _min));
    }
}

- (void)testValueIsSecret {
    int secret = [mode secret];
    XCTAssertTrue([mode valueIsSecret:secret]);
}


@end
