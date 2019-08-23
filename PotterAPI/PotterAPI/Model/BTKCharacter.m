//
//  Character.m
//  PotterAPI
//
//  Created by Blake kvarfordt on 8/22/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

#import "BTKCharacter.h"

@implementation BTKCharacter

- (instancetype)initwithCharacterName:(NSString *)name house:(NSString *)house boggart:(NSString *)boggart deathEater:(BOOL)deathEater
{
    self = [super init];
    
    if (self) {
        _name = name;
        _house = house;
        _boggart = boggart;
        _deathEater = deathEater;
    }
    return self;
}

@end



@implementation BTKCharacter (jsonConvertible)

- (BTKCharacter *)initwithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[@"name"];
    NSString *house = dictionary[@"house"];
    NSString *boggart = dictionary[@"boggart"];
    BOOL deathEater = dictionary[@"deathEater"];
    
    return [self initwithCharacterName:name house:house boggart:boggart deathEater:deathEater];
}

@end
