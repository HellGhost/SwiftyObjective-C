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
@property (nonatomic, strong) NSMutableArray *students;
@end

@implementation SwiftyObjectiveCArrayTests

- (void)setUp {
    [super setUp];
    StudentTest *first = [[StudentTest alloc] initWithName:@"Mark" age:17];
    StudentTest *second = [[StudentTest alloc] initWithName:@"Steve" age:17];
    StudentTest *third = [[StudentTest alloc] initWithName:@"Kurt" age:18];

    self.students = [NSMutableArray arrayWithArray:@[first, second, third]];
}

- (void)tearDown {

    [super tearDown];
}

- (void)testMap {
    NSArray *testData = @[@"Mark", @"Steve", @"Kurt"];

    NSArray *studentsNames = [self.students map:^NSString *(StudentTest *student) {
        return student.name;
    }];

    XCTAssertTrue(testData.count == studentsNames.count, @"Same count");

    NSString *testResult = [testData componentsJoinedByString:@""];
    NSString *mapResult = [studentsNames componentsJoinedByString:@""];

    XCTAssertTrue([testResult isEqualToString:mapResult], "Must be the same");
}

- (void)testFlatMap {
    StudentTest *withoutName = [[StudentTest alloc] initWithName:nil age:18];
    [self.students addObject:withoutName];

    NSArray *studentsNames = [self.students flatMap:^NSString *(StudentTest *student) {
        return student.name;
    }];

    XCTAssertTrue(self.students.count != studentsNames.count, @"exclude student with empty name");

    XCTAssertTrue(studentsNames.count == 3, "must be 3 students exclude last");

    NSArray *testData = @[@"Mark", @"Steve", @"Kurt"];

    NSString *testResult = [testData componentsJoinedByString:@""];
    NSString *mapResult = [studentsNames componentsJoinedByString:@""];

    XCTAssertTrue([testResult isEqualToString:mapResult], "Must be the same");
}

- (void)testFilter {
    NSArray <StudentTest *>*filteredStudents = [self.students filter:^BOOL(StudentTest *student) {
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
