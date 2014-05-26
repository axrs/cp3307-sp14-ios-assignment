//
//  ASGameCoreTest.m
//  Number Guess
//
//  Created by Alexander Scott on 26/05/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ASGameCore.h"

@interface ASGameCoreTest : XCTestCase

@end

@implementation ASGameCoreTest {
    ASGameCore *_core;

}

- (void)setUp {
    [super setUp];
    _core = [[ASGameCore alloc] initWithRangeFrom:1 To:100];

}

- (void)tearDown {
    _core = nil;
    [super tearDown];
}


- (void)testInit {
    _core = [[ASGameCore alloc] init];
    XCTAssertEqual(0, [_core minimumValue]);
    XCTAssertEqual(0, [_core maximumValue]);
    XCTAssertEqual(0, [_core score]);
}

- (void)testInitWithRange {
    _core = [[ASGameCore alloc] initWithRangeFrom:1 To:100];
    XCTAssertEqual(1, [_core minimumValue]);
    XCTAssertEqual(100, [_core maximumValue]);
}

- (void)testRange {
    [_core setMaximumValue:50];
    [_core setMinimumValue:10];
    XCTAssertEqual(10, [_core minimumValue]);
    XCTAssertEqual(50, [_core maximumValue]);
}

- (void)testKeys {
    //No Keys generated before reset.  Defaults to 1.
    XCTAssertEqual(1, [[_core keys] count]);

    //Reset with max 100 should produce 1, 2, 4, 8, 16, 32, 64
    [_core reset];
    XCTAssertEqual(7, [[_core keys] count]);

    //Reset with max 24 should produce 1, 2, 4, 8, 16
    [_core setMaximumValue:24];
    [_core reset];
    XCTAssertEqual(5, [[_core keys] count]);
}

- (void)testCards {
    _core = [[ASGameCore alloc] initWithRangeFrom:1 To:10];
    [_core reset];
    XCTAssertEqual(4, [[_core cards] count]);
}

@end
