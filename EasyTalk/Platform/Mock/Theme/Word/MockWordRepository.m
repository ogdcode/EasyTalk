//
//  MockWordRepository.m
//  EasyTalk
//
//  Created by Olivier Gonçalves on 27/11/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import "MockGroupingRepository.h"
#import "MockWordRepository.h"

@implementation MockWordRepository

@synthesize mockList = mockList_;

- (void)saveWord:(Word *)w {}

- (void)deleteWord:(Word *)w {}

- (Word *)getWordWithName:(NSString *)name
{
    NSArray<Word *> *mockList = [self getWordList];
    for (Word *w in mockList) {
        if ([w.name isEqualToString:name]) {
            return w;
        }
    }
    
    return nil;
}

- (NSArray<Word *> *)getWordList
{
    self.mockList = [NSMutableArray new];
    NSArray<Grouping *> *mockGrpList = [[MockGroupingRepository new] getGroupingList];
    
    Word *w1 = [[Word alloc] initWithName:@"Chocolatine" id:@1 grouping:[mockGrpList objectAtIndex:0]];
    w1.isInFavorites = YES;
    Word *w2 = [[Word alloc] initWithName:@"Croissant" id:@2 grouping:[mockGrpList objectAtIndex:0]];
    w2.isInFavorites = YES;
    Word *w3 = [[Word alloc] initWithName:@"Baguette" id:@3 grouping:[mockGrpList objectAtIndex:0]];
    w3.isInFavorites = YES;
    
    Word *w4 = [[Word alloc] initWithName:@"Metro" id:@4 grouping:[mockGrpList objectAtIndex:1]];
    w4.isInFavorites = YES;
    Word *w5 = [[Word alloc] initWithName:@"Ticket" id:@5 grouping:[mockGrpList objectAtIndex:1]];
    Word *w6 = [[Word alloc] initWithName:@"Tramway" id:@6 grouping:[mockGrpList objectAtIndex:1]];
    
    Word *w7 = [[Word alloc] initWithName:@"Taille 36" id:@7 grouping:[mockGrpList objectAtIndex:2]];
    Word *w8 = [[Word alloc] initWithName:@"Taille 38" id:@8 grouping:[mockGrpList objectAtIndex:2]];
    Word *w9 = [[Word alloc] initWithName:@"Taille 40" id:@9 grouping:[mockGrpList objectAtIndex:2]];
    
    Word *w10 = [[Word alloc] initWithName:@"Menu" id:@10 grouping:[mockGrpList objectAtIndex:3]];
    w10.isInFavorites = YES;
    Word *w11 = [[Word alloc] initWithName:@"Assiette" id:@11 grouping:[mockGrpList objectAtIndex:3]];
    w11.isInFavorites = YES;
    Word *w12 = [[Word alloc] initWithName:@"Serveur" id:@12 grouping:[mockGrpList objectAtIndex:3]];
    
    [self.mockList addObject:w1];
    [self.mockList addObject:w2];
    [self.mockList addObject:w3];
    [self.mockList addObject:w4];
    [self.mockList addObject:w5];
    [self.mockList addObject:w6];
    [self.mockList addObject:w7];
    [self.mockList addObject:w8];
    [self.mockList addObject:w9];
    [self.mockList addObject:w10];
    [self.mockList addObject:w11];
    [self.mockList addObject:w12];
    
    return self.mockList;
}

- (NSArray<Word *> *)getWordListForGrouping:(Grouping *)grp
{
    NSArray<Word *> *mockList = [self getWordList];
    NSMutableArray<Word *> *result = [NSMutableArray new];
    
    for (Word *w in mockList) {
        if ([w.grouping isEqualToGrouping:grp]) {
            [result addObject:w];
        }
    }
    
    return result;
}

- (NSArray<Word *> *)getFavoriteWordList
{
    NSArray<Word *> *mockList = [self getWordList];
    NSMutableArray<Word *> *result = [NSMutableArray new];
    
    for (Word *w in mockList) {
        if ([w isInFavorites]) {
            [result addObject:w];
        }
    }
    
    return result;
}

- (NSArray<Word *> *)getFavoriteWordListForGrouping:(Grouping *)grp
{
    NSArray<Word *> *mockList = [self getWordList];
    NSMutableArray<Word *> *result = [NSMutableArray new];
    
    for (Word *w in mockList) {
        if ([w.grouping isEqualToGrouping:grp] && [w isInFavorites]) {
            [result addObject:w];
        }
    }
    
    return result;
}

- (NSArray<Grouping *> *)getUniqueGroupingList
{
    NSArray<Word *> *mockList = [self getWordList];
    NSMutableArray<Grouping *> *uniqueGrpList = [NSMutableArray new];
    for (Word *w in mockList) {
        Grouping *grp = w.grouping;
        if ([uniqueGrpList containsObject:grp]) {
            NSUInteger indexOf = [uniqueGrpList indexOfObject:grp];
            [uniqueGrpList replaceObjectAtIndex:indexOf withObject:grp];
        } else {
            [uniqueGrpList addObject:grp];
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
    NSArray<Word *> *wordList = [self getWordList];
    NSArray<Grouping *> *grpList = [self getUniqueGroupingList];
    NSMutableDictionary *result = [NSMutableDictionary new];

    NSUInteger e = [grpList count];
    for (NSUInteger i = 0; i < e; ++i) {
        Grouping *grp = [grpList objectAtIndex:i];
        NSString *grpKey = [NSString stringWithFormat:@"%@ #%lu", GRP, i+1];
        [result setObject:grp.name forKey:grpKey];
    }
    e = [wordList count];
    for (NSUInteger i = 0; i < e; ++i) {
        Word *w = [wordList objectAtIndex:i];
        NSString *wordKey = ([w isInFavorites]) ? [NSString stringWithFormat:@"%@ #%lu", FAVWORD, i+1] : [NSString stringWithFormat:@"%@ #%lu", WORD, i+1];
        [result setObject:w.name forKey:wordKey];
    }
    e = [wordList count];
    for (NSUInteger i = 0; i < e; ++i) {
        Word *w = [wordList objectAtIndex:i];
        NSString *wordKey = [NSString stringWithFormat:@"%@ #%lu(%@)", WORD, i+1, w.grouping.name];
        [result setObject:w.name forKey:wordKey];
    }
    
    return result;
}


@end
