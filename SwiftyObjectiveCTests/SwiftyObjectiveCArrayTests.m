//
//  SwiftyObjectiveCArrayTests.m
//  SwiftyObjectiveCTests
//
//  Created by Yerofieiev, Vladyslav on 11/7/17.
//  Copyright © 2017 Hell_Ghost. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "StudentTest.h"
#import <SwiftyObjectiveC/SwiftyObjectiveC.h>


@interface SwiftyObjectiveCArrayTests : XCTestCase
@property (nonatomic, strong) NSMutableArray <StudentTest *> *students;
@end

@implementation SwiftyObjectiveCArrayTests

- (void)setUp {
    [super setUp];
    let first = [[StudentTest alloc] initWithName:@"Mark" age:17];
    let second = [[StudentTest alloc] initWithName:@"Steve" age:17];
    let third = [[StudentTest alloc] initWithName:@"Kurt" age:18];

    self.students = [NSMutableArray arrayWithArray:@[first, second, third]];
}

- (void)tearDown {

    [super tearDown];
}

- (void)testMap {
    let testData = @[@"Mark", @"Steve", @"Kurt"];

    let studentsNames = [self.students map:^NSString *(StudentTest *student) {
        return student.name;
    }];

    XCTAssertTrue(testData.count == studentsNames.count, @"Same count");

    let testResult = [testData componentsJoinedByString:@""];
    let mapResult = [studentsNames componentsJoinedByString:@""];

    XCTAssertTrue([testResult isEqualToString:mapResult], "Must be the same");
}

- (void)testFlatMap {
    let withoutName = [[StudentTest alloc] initWithName:nil age:18];
    [self.students addObject:withoutName];

    let studentsNames = [self.students flatMap:^NSString *(StudentTest *student) {
        return student.name;
    }];

    XCTAssertTrue(self.students.count != studentsNames.count, @"exclude student with empty name");

    XCTAssertTrue(studentsNames.count == 3, "must be 3 students exclude last");

    let testData = @[@"Mark", @"Steve", @"Kurt"];

    let testResult = [testData componentsJoinedByString:@""];
    let mapResult = [studentsNames componentsJoinedByString:@""];

    XCTAssertTrue([testResult isEqualToString:mapResult], "Must be the same");
}

- (void)testFilter {
    NSArray <StudentTest *> *filteredStudents = [self.students filter:^BOOL(StudentTest *student) {
        return student.age >= 18;
    }];

    XCTAssertTrue(filteredStudents.count == 1, @"Must be only one student");
    XCTAssertTrue(filteredStudents.firstObject.age == 18, @"Age must be 18");
    XCTAssertTrue([filteredStudents.firstObject.name isEqualToString:@"Kurt"]);

    filteredStudents = [self.students filter:^BOOL(StudentTest *student) {
        return student.age < 18;
    }];

    XCTAssertTrue(filteredStudents.count == 2, @"Must be 2 student");
}

@end
