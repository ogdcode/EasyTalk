//
//  MockGroupingRepository.m
//  EasyTalk
//
//  Created by Olivier Gonçalves on 27/11/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import "MockGroupingRepository.h"

@implementation MockGroupingRepository

@synthesize mockList = mockList_;

- (void) saveGrouping:(id)gr { }

- (void) deleteGrouping:(id)gr { }

- (Grouping *)getGroupingWithName:(NSString *)name
{
    NSArray<Grouping *> *mockList = [self getGroupingList];
    for (Grouping *grp in mockList) {
        if ([grp.name isEqualToString:name]) {
            return grp;
        }
    }
    
    return nil;
}

- (NSArray<Grouping *> *)getGroupingList
{
    self.mockList = [NSMutableArray new];
    
    Grouping* gr1 = [[Grouping alloc] initWithName:@"Boulangerie" id:@1];
    
    Grouping* gr2 = [[Grouping alloc] initWithName:@"Transports" id:@2];
    gr2.isInFavorites = YES;
    
    Grouping* gr3 = [[Grouping alloc] initWithName:@"Vetements" id:@3];
    gr3.isInFavorites = YES;
    
    Grouping* gr4 = [[Grouping alloc] initWithName:@"Restaurant" id:@4];
    
    [self.mockList addObject:gr1];
    [self.mockList addObject:gr2];
    [self.mockList addObject:gr3];
    [self.mockList addObject:gr4];
    
    return self.mockList;
}

- (NSArray<Grouping *> *)getFavoriteGroupingList
{
    NSArray<Grouping *> *mockList = [self getGroupingList];
    NSMutableArray<Grouping *> *result = [NSMutableArray new];
    
    for (Grouping *grp in mockList) {
        if ([grp isInFavorites]) {
            [result addObject:grp];
        }
    }
    
    return result;
}

- (NSDictionary *)dictionarize:(NSArray<Grouping *> *)grpList
{
    NSMutableDictionary *result = [NSMutableDictionary new];
    NSUInteger e = [grpList count];
    for (NSUInteger i = 0; i < e; ++i) {
        NSString *grpName = [grpList objectAtIndex:i].name;
        NSString *grpKey = [NSString stringWithFormat:@"%@ #%lu", ITEM, i+1];
        [result setObject:grpName forKey:grpKey];
    }
    
    return result;
}

@end
