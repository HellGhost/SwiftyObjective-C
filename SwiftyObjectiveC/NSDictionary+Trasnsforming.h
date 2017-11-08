//
//  NSDictionary+Trasnsforming.h
//  SwiftyObjectiveC
//
//  Created by Yerofieiev, Vladyslav on 11/8/17.
//  Copyright © 2017 Hell_Ghost. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary <__covariant KeyType, __covariant ObjectType> (Trasnsforming)
typedef _Nonnull id (^MapCallblockD) (_Nonnull KeyType key, _Nonnull ObjectType object);
typedef BOOL (^FilterCallblockD)(_Nonnull KeyType key, _Nonnull ObjectType object);

/**
 Returns an array containing the results of mapping the given block over the sequence’s elements.

 @param transform A mapping block. transform accepts an element of this sequence as its parameter and returns a transformed value of the same or of a different type.
 @return An array containing the transformed elements of this sequence.
 */
- (NSArray * _Nonnull )map:(_Nonnull MapCallblockD)transform;

/**
 Returns an array containing the results of mapping the given block over the sequence’s elements.

 @param transform A mapping block. transform accepts an element of this sequence as its parameter and returns a transformed value of the same or of a different type.
 @return An array containing the transformed elements of this sequence.
 */
- (NSArray * _Nonnull )flatMap:(_Nonnull MapCallblockD)transform;

/**
 Returns a new dictionary containing the elements of the set that satisfy the given predicate.

 @param isIncluded A block that takes an element as its argument and returns a Boolean value indicating whether the element should be included in the returned dictionary.
 @return A dictionart of the elements that isIncluded allows.
 */
- (NSDictionary <KeyType , ObjectType>* _Nonnull )filter:(_Nonnull FilterCallblockD)isIncluded;

@end
