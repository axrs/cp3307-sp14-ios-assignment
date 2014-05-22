//
//  ASBinaryGameKeyGeneratorTest.m
//  Number Guess
//
//  Created by Alexander Scott on 22/05/2014.
//  Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ASBinaryGameKeyGenerator.h"

@interface ASBinaryGameKeyGeneratorTest : XCTestCase

@end

@implementation ASBinaryGameKeyGeneratorTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    ASBinaryGameKeyGenerator *gen = [[ASBinaryGameKeyGenerator alloc] init];
    XCTAssertEqual(0, [gen maximumValue]);

    //Binary requires 1 to display a value of 0.
    XCTAssertEqual(1, [[gen generateKeys] count]);
    XCTAssertEqual(1, [[[gen generateKeys] objectAtIndex:0] integerValue]);

}

-(void)testInitWithMaximumValue{
    ASBinaryGameKeyGenerator *gen = [[ASBinaryGameKeyGenerator alloc] initWithMaximumValue:20];
    //1,2,4,8,16
    //8+4+2+1 = 15;
    //   16+4 = 20;
    XCTAssertEqual(20, [gen maximumValue]);
    XCTAssertEqual(5, [[gen generateKeys] count]);

    XCTAssertEqual(1, [[[gen generateKeys] objectAtIndex:0] integerValue]);
    XCTAssertEqual(2, [[[gen generateKeys] objectAtIndex:1] integerValue]);
    XCTAssertEqual(4, [[[gen generateKeys] objectAtIndex:2] integerValue]);
    XCTAssertEqual(8, [[[gen generateKeys] objectAtIndex:3] integerValue]);
    XCTAssertEqual(16, [[[gen generateKeys] objectAtIndex:4] integerValue]);
}


@end
