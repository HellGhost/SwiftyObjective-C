//
//  StudentTest.m
//  SwiftyObjectiveCTests
//
//  Created by Yerofieiev, Vladyslav on 11/7/17.
//  Copyright © 2017 Hell_Ghost. All rights reserved.
//

#import "StudentTest.h"

@implementation StudentTest
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age {
    self = [super init];
    if (self) {
        self.name = name;
        self.age = age;
    }

    return self;
}
@end
