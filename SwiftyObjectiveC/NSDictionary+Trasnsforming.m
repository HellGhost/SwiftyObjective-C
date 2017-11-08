//
//  NSDictionary+Trasnsforming.m
//  SwiftyObjectiveC
//
//  Created by Yerofieiev, Vladyslav on 11/8/17.
//  Copyright © 2017 Hell_Ghost. All rights reserved.
//

#import "NSDictionary+Trasnsforming.h"

@implementation NSDictionary (Trasnsforming)
- (NSArray * _Nonnull )map:(_Nonnull MapCallblockD)transform {
    NSMutableArray *result = [NSMutableArray new];

    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [result addObject:transform(key, obj)];
    }];

    return [[NSArray alloc] initWithArray:result];

}

- (NSArray * _Nonnull )flatMap:(_Nonnull MapCallblockD)transform {
    NSMutableArray *result = [NSMutableArray new];
     [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        id mapObject = transform(key, obj);
        if (mapObject != nil) {
            [result addObject:mapObject];
        }
     }];

    return [[NSArray alloc] initWithArray:result];
}

- (NSDictionary * _Nonnull )filter:(_Nonnull FilterCallblockD)isIncluded {
    NSMutableDictionary *result = [NSMutableDictionary new];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if (isIncluded(key, obj) == YES) {
            [result setObject:obj forKey:key];
        }
    }];

    return result;
}
@end
