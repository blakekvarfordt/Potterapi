//
//  Character.h
//  PotterAPI
//
//  Created by Blake kvarfordt on 8/22/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BTKCharacter : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly, nullable) NSString *house;
@property (nonatomic, copy, readonly, nullable) NSString *boggart;
@property (nonatomic, readonly) BOOL deathEater;

- (instancetype)initwithCharacterName:(NSString *)name house:(NSString *)house boggart:(NSString *)boggart deathEater:(BOOL)deathEater;

@end



@interface BTKCharacter (jsonConvertible)

- (BTKCharacter *)initwithDictionary:(NSDictionary<NSString *, id>*)dictionary;

@end



NS_ASSUME_NONNULL_END
