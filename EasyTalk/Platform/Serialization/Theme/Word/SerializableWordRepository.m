//
//  SerializableWordRepository.m
//  EasyTalk
//
//  Created by Olivier Gonçalves on 27/11/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import "SerializableWordRepository.h"

@implementation SerializableWordRepository

@synthesize filePath = filePath_, wordList = wordList_;

- (instancetype)initWithFileName:(NSString *)fileName
{
    if ((self = [super init])) {
        NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        self.filePath = [[documentPaths objectAtIndex:0] stringByAppendingPathComponent:fileName];
        self.wordList = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
    }
    
    return self;
}

- (void)saveWord:(Word *)w
{
    if (self.wordList == nil) {
        self.wordList = [NSMutableArray new];
    }
    
    NSUInteger indexOf = [self.wordList indexOfObject:w];
    if (indexOf != NSNotFound) {
        [self.wordList replaceObjectAtIndex:indexOf withObject:w];
    } else {
        [self.wordList addObject:w];
    }
    [NSKeyedArchiver archiveRootObject:self.wordList toFile:self.filePath];
}

- (void)deleteWord:(Word *)w
{
    [self.wordList removeObject:w];
    [NSKeyedArchiver archiveRootObject:self.wordList toFile:self.filePath];
}

- (Word *)getWordWithName:(NSString *)name
{
    for (Word *w in self.wordList) {
        if ([w.name isEqualToString:name]) {
            return w;
        }
    }
    
    return nil;
}

- (NSArray<Word *> *)getWordList
{
    return self.wordList;
}

- (NSArray<Word *> *)getWordListForGrouping:(Grouping *)grp
{
    NSMutableArray<Word *> *result = [NSMutableArray new];
    
    for (Word *w in self.wordList) {
        if ([w.grouping isEqualToGrouping:grp]) {
            [result addObject:w];
        }
    }
    
    return result;
}

- (NSArray<Word *> *)getFavoriteWordList
{
    NSMutableArray<Word *> *result = [NSMutableArray new];
    
    for (Word *w in self.wordList) {
        if ([w isInFavorites]) {
            [result addObject:w];
        }
    }
    
    return result;
}

- (NSArray<Word *> *)getFavoriteWordListForGrouping:(Grouping *)grp
{
    NSMutableArray<Word *> *result = [NSMutableArray new];
    
    for (Word *w in self.wordList) {
        if ([w.grouping isEqualToGrouping:grp] && [w isInFavorites]) {
            [result addObject:w];
        }
    }
    
    return result;
}

- (NSArray<Grouping *> *)getUniqueGroupingList
{
    NSMutableArray<Grouping *> *uniqueGrpList = [NSMutableArray new];
    for (Word *w in self.wordList) {
        if (![uniqueGrpList containsObject:w.grouping]) {
            [uniqueGrpList addObject:w.grouping];
        }
    }
    
    return uniqueGrpList;
}

- (NSDictionary *)dictionarize:(NSArray<Word *> *)wordList
{
    NSMutableDictionary *result = [NSMutableDictionary new];
    NSUInteger e = [wordList count];
    for (NSUInteger i = 0; i < e; ++i) {
        NSString *grpName = [wordList objectAtIndex:i].name;
        NSString *grpKey = [NSString stringWithFormat:@"%@ #%lu", ITEM, i+1];
        [result setObject:grpName forKey:grpKey];
    }
    
    return result;
}

- (NSDictionary *)combinedDictionarize
{
    NSArray<Word *> *wordList = self.wordList;
    NSArray<Grouping *> *grpList = [self getUniqueGroupingList];
    NSMutableDictionary *result = [NSMutableDictionary new];
    NSUInteger e = [grpList count];
    for (NSUInteger i = 0; i < e; ++i) {
        Grouping *grp = [grpList objectAtIndex:i];
        NSString *grpKey = [NSString stringWithFormat:@"%@ #%lu", GRP, i];
        [result setObject:grp.name forKey:grpKey];
    }
    e = [wordList count];
    for (NSUInteger i = 0; i < e; ++i) {
        Word *w = [wordList objectAtIndex:i];
        NSString *wordKey = [NSString stringWithFormat:@"%@ #%lu", WORD, i];
        [result setObject:w.name forKey:wordKey];
    }
    
    return result;
}

@end
