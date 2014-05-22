//
//  ASCardTest.m
//  Number Guess
//
//  Created by Alexander Scott on 22/05/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ASCard.h"

@interface ASCardTest : XCTestCase

@end

@implementation ASCardTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    ASCard *c = [[ASCard alloc] init];
    XCTAssertEqual(0, [[c values] count]);
}

- (void)testInitWithValue {
    ASCard *c = [[ASCard alloc] initWithValue:2];
    XCTAssertEqual(1, [[c values] count]);
    XCTAssertEqual(2, [[[c values] objectAtIndex:0] integerValue]);
}

- (void)testAddValue {
    ASCard *c = [[ASCard alloc] initWithValue:2];
    [c addValue:123];

    XCTAssertEqual(2, [[c values] count]);
    XCTAssertEqual(2, [[[c values] objectAtIndex:0] integerValue]);
    XCTAssertEqual(123, [[[c values] objectAtIndex:1] integerValue]);
}

- (void)testContainsValue {
    ASCard *c = [[ASCard alloc] initWithValue:2];
    [c addValue:123];

    XCTAssertTrue([c containsValue:123]);
    XCTAssertTrue([c containsValue:2]);
}

@end
