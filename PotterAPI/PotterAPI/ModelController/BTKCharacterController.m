//
//  BTKCharacterController.m
//  PotterAPI
//
//  Created by Blake kvarfordt on 8/22/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

#import "BTKCharacterController.h"

static NSString * const baseURLString = @"https://www.potterapi.com/v1";
static NSString * const characterComponent = @"characters";
static NSString * const apiKey = @"key";
static NSString * const apiValue = @"$2a$10$zcsg1MgiqBi2NkbSArK.xO7RXyDhsddQKjnLLYmaiY6s9YICbqwv2";

@implementation BTKCharacterController

+ (void)fetchCharactersWithCompletion:(void (^)(NSArray<BTKCharacter *> *))completion
{
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    NSURL *characterURL = [baseURL URLByAppendingPathComponent:characterComponent];
    
    NSURLQueryItem *apiKeyQueryItem = [NSURLQueryItem queryItemWithName:apiKey value:apiValue];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:characterURL resolvingAgainstBaseURL:true];
    
    components.queryItems = @[apiKeyQueryItem];
    
    NSURL *finalURL = [components URL];
    
    NSLog(@"%@", finalURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        if (error)
        {
            NSLog(@"ERROR getting URL %@", error);
            completion(nil);
        }
        
        if (!data)
        {
            NSLog(@"ERROR getting data %@", error);
            completion(nil);
        }
        
        if (data)
        {
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            if (!topLevelDictionary)
            {
                NSLog(@"Error parsing the json %@", error);
                completion(nil);
            }
            
            
            NSMutableArray<BTKCharacter *> *characters = [NSMutableArray new];
            
            for (NSDictionary *characterDict in topLevelDictionary)
            {
                BTKCharacter *character = [[BTKCharacter alloc] initWithDictionary:characterDict];
                
                [characters addObject:character];
            }
            completion(characters);
        }
        
    }]resume];
    
}



@end
