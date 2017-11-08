//
//  SwiftyObjectiveCDictionaryTests.m
//  SwiftyObjectiveCTests
//
//  Created by Yerofieiev, Vladyslav on 11/8/17.
//  Copyright © 2017 Hell_Ghost. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "StudentTest.h"
#import <SwiftyObjectiveC/SwiftyObjectiveC.h>

@interface SwiftyObjectiveCDictionaryTests : XCTestCase
@property (nonatomic, strong) NSMutableDictionary <NSString * ,StudentTest *> *students;
@end

@implementation SwiftyObjectiveCDictionaryTests

- (void)setUp {
    [super setUp];

    let first = [[StudentTest alloc] initWithName:@"Mark" age:17];
    let second = [[StudentTest alloc] initWithName:@"Steve" age:17];
    let third = [[StudentTest alloc] initWithName:@"Kurt" age:18];
    
    self.students = [NSMutableDictionary dictionaryWithDictionary: @{@"first": first, @"second" : second, @"third" : third}];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testMap {

    let testData = @[@"first-Mark", @"second-Steve", @"third-Kurt"];

    let mapData = [self.students map:^id _Nonnull(NSString * _Nonnull key, StudentTest * _Nonnull object) {
        return [NSString stringWithFormat:@"%@-%@", key, object.name];
    }];

    XCTAssertTrue(mapData.count == 3, "must be 3");

    let testResult = [testData componentsJoinedByString:@""];
    let mapResult = [mapData componentsJoinedByString:@""];

    XCTAssertTrue([testResult isEqualToString:mapResult], "Must be the same");
}

- (void)testFlatMap {

    [self.students setObject:[[StudentTest alloc] initWithName:nil age:10] forKey:@"Last"];

    let testData = @[@"Mark",@"Kurt", @"Steve"];

    let mapData = [self.students flatMap:^id _Nonnull(NSString * _Nonnull key, StudentTest * _Nonnull object) {
        return object.name;
    }];

    XCTAssertTrue(self.students.count != mapData.count, "Skip last");
    XCTAssertTrue(mapData.count == 3, "must be 3");

    let testResult = [testData componentsJoinedByString:@""];
    let mapResult = [mapData componentsJoinedByString:@""];

    XCTAssertTrue([testResult isEqualToString:mapResult], "Must be the same");

}
- (void)testFilter {
    let filterResult = [self.students filter:^BOOL(NSString * _Nonnull key, StudentTest * _Nonnull object) {
        return [key isEqualToString:@"second"];
    }];

    XCTAssertTrue(filterResult.count == 1);
    XCTAssertNotNil(filterResult[@"second"]);
    XCTAssertTrue([filterResult[@"second"].name isEqualToString:@"Steve"]);
}

@end
