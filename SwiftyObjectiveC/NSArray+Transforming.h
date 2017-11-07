//
//  NSArray+Transforming.h
//  SwiftyObjectiveC
//
//  Created by Yerofieiev, Vladyslav on 11/7/17.
//  Copyright © 2017 Hell_Ghost. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef _Nonnull id (^MapCallblock) (_Nonnull id object);
typedef BOOL (^FilterCallblock)(_Nonnull id object);

@interface NSArray(Transforming)
- (NSArray * _Nonnull )map:(_Nonnull MapCallblock)callblock;
- (NSArray * _Nonnull )flatMap:(_Nonnull MapCallblock)callblock;

- (NSArray * _Nonnull )filter:(_Nonnull FilterCallblock)callblock;
@end
