//
//  NSArray+Transforming.m
//  TestObj-C
//
//  Created by Yerofieiev, Vladyslav on 11/7/17.
//  Copyright © 2017 Yerofieiev, Vladyslav. All rights reserved.
//

#import "NSArray+Transforming.h"

@implementation NSArray(Transforming)
- (NSArray *)map:(MapCallblock)callblock {
    NSMutableArray *result = [NSMutableArray new];
    for (id object in self) {
        [result addObject:callblock(object)];
    }
    
    return [[NSArray alloc] initWithArray:result];
}

- (NSArray * _Nonnull )filter:(_Nonnull FilterCallblock)callblock {
    NSMutableArray *result = [NSMutableArray new];
    for (id object in self) {
        if (callblock(object) == YES) {
            [result addObject:object];
        }
    }

    return result;
}
@end
