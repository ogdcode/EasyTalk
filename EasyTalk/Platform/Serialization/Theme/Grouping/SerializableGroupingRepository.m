//
//  SerializableGroupingRepository.m
//  EasyTalk
//
//  Created by Olivier Gonçalves on 27/11/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import "SerializableGroupingRepository.h"

@implementation SerializableGroupingRepository

@synthesize filePath = filePath_, groupingList = groupingList_;

- (instancetype)initWithFileName:(NSString *)fileName
{
    if ((self = [super init])) {
        NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        self.filePath = [[documentPaths objectAtIndex:0] stringByAppendingPathComponent:fileName];
        self.groupingList = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
    }
    
    return self;
}

- (void)saveGrouping:(Grouping *)grp
{
    if (self.groupingList == nil) {
        self.groupingList = [NSMutableArray new];
    }
    
    NSUInteger indexOf = [self.groupingList indexOfObject:grp];
    if (indexOf != NSNotFound) {
        [self.groupingList replaceObjectAtIndex:indexOf withObject:grp];
    } else {
        [self.groupingList addObject:grp];
    }
    [NSKeyedArchiver archiveRootObject:self.groupingList toFile:self.filePath];
}

- (void)deleteGrouping:(Grouping *)grp
{
    [self.groupingList removeObject:grp];
    [NSKeyedArchiver archiveRootObject:self.groupingList toFile:self.filePath];
}

- (Grouping *)getGroupingWithName:(NSString *)name
{
    for (Grouping *grp in self.groupingList) {
        if ([grp.name isEqualToString:name]) {
            return grp;
        }
    }
    
    return nil;
}

- (NSArray<Grouping *> *)getGroupingList
{
    return self.groupingList;
}

- (NSArray<Grouping *> *)getFavoriteGroupingList
{
    NSMutableArray<Grouping *> *result = [NSMutableArray new];
    
    for (Grouping *grp in self.groupingList) {
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