//
//  BTKCharacterController.h
//  PotterAPI
//
//  Created by Blake kvarfordt on 8/22/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTKCharacter.h"

NS_ASSUME_NONNULL_BEGIN

@interface BTKCharacterController : NSObject

+ (void)fetchCharactersWithCompletion:(void(^) (NSArray<BTKCharacter *> *))completion;


@end

NS_ASSUME_NONNULL_END
