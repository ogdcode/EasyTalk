//
//  SerializableWordRepository.h
//  EasyTalk
//
//  Created by Olivier Gonçalves on 27/11/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IWordRepository.h"
#import "Constants.h"

@interface SerializableWordRepository : NSObject <IWordRepository>
{
    @private
    NSString *filePath_;
    NSMutableArray<Word *> *wordList_;
}
@property (strong, nonatomic) NSString *filePath;
@property (strong, nonatomic) NSMutableArray<Word *> *wordList;

- (instancetype)initWithFileName:(NSString *)fileName;

@end
