//
//  WordRepositoryFactory.h
//  EasyTalk
//
//  Created by Olivier Gonçalves on 27/11/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IWordRepository.h"

@interface WordRepositoryFactory : NSObject
{
    @private
    id<IWordRepository> wordRepository_;
}

+ (instancetype)sharedInstance;

- (id<IWordRepository>)wordRepository;

@end
