//
//  IWordRepository.h
//  EasyTalk
//
//  Created by Olivier Gonçalves on 27/11/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Word.h"

@protocol IWordRepository <NSObject>

@required
- (void)saveWord:(Word *)w;
- (void)deleteWord:(Word *)w;
- (Word *)getWordWithName:(NSString *)name;
- (NSArray<Word *> *)getWordList;
- (NSArray<Word *> *)getFavoriteWordList;
- (NSArray<Word *> *)getWordListForGrouping:(Grouping *)grp;
- (NSArray<Word *> *)getFavoriteWordListForGrouping:(Grouping *)grp;
- (NSArray<Grouping *> *)getUniqueGroupingList;
- (NSDictionary *)dictionarize:(NSArray<Word *> *)wordList;
- (NSDictionary *)combinedDictionarize;

@end
