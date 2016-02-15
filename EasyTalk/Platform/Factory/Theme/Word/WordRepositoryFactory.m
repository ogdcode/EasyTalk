//
//  WordRepositoryFactory.m
//  EasyTalk
//
//  Created by Olivier Gonçalves on 27/11/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import "WordRepositoryFactory.h"
#import "SerializableWordRepository.h"
#import "MockWordRepository.h"

static WordRepositoryFactory *sharedInstance_ = nil;

@implementation WordRepositoryFactory

+ (instancetype)sharedInstance
{
    if (sharedInstance_ == nil) {
        sharedInstance_ = [WordRepositoryFactory new];
    }
    
    return sharedInstance_;
}

- (id<IWordRepository>)wordRepository
{
    if (!wordRepository_) {
        wordRepository_ = [MockWordRepository new];
    }
    
    return wordRepository_;
}

@end
