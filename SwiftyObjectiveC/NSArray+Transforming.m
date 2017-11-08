//
//  NSArray+Transforming.m
//  SwiftyObjectiveC
//
//  Created by Yerofieiev, Vladyslav on 11/7/17.
//  Copyright © 2017 Hell_Ghost. All rights reserved.
//

#import "NSArray+Transforming.h"

@implementation NSArray(Transforming)

- (NSArray * _Nonnull )map:(_Nonnull MapCallblock)transform {
    NSMutableArray *result = [NSMutableArray new];
    for (id object in self) {
        [result addObject:transform(object)];
    }
    
    return [[NSArray alloc] initWithArray:result];
}

- (NSArray * _Nonnull )flatMap:(_Nonnull MapCallblock)transform{
    NSMutableArray *result = [NSMutableArray new];
    for (id object in self) {
        id mapObject = transform(object);
        if (mapObject != nil) {
            [result addObject:mapObject];
        }
    }

    return [[NSArray alloc] initWithArray:result];
}

- (NSArray * _Nonnull )filter:(_Nonnull FilterCallblock)isIncluded {
    NSMutableArray *result = [NSMutableArray new];
    for (id object in self) {
        if (isIncluded(object) == YES) {
            [result addObject:object];
        }
    }

    return result;
}
@end
