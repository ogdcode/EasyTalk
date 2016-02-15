//
//  Word.m
//  EasyTalk
//
//  Created by Olivier Gonçalves on 20/11/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import "Word.h"

@implementation Word

@synthesize name = name_, wordId = wordId_, isInFavorites = isInFavorites_, grouping = grouping_;

- (id)initWithName:(NSString *)name id:(NSNumber *)wordId grouping:(Grouping *)grouping
{
    if ((self = [super init])) {
        self.name = name;
        self.wordId = wordId;
        self.isInFavorites = NO;
        self.grouping = grouping;
    }
    
    return self;
}

- (BOOL)isEqualToWord:(Word *)w
{
    return [self.name isEqualToString:w.name];
}

- (BOOL)isInSameGroupingAs:(Word *)w
{
    return [self.grouping isEqualToGrouping:w.grouping];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super init])) {
        self.name = [aDecoder decodeObjectForKey:kName];
        self.wordId = [aDecoder decodeObjectForKey:kWordId];
        self.isInFavorites = [aDecoder decodeBoolForKey:kIsInFavorites];
        self.grouping = [aDecoder decodeObjectForKey:kGrouping];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:kName];
    [aCoder encodeObject:self.wordId forKey:kWordId];
    [aCoder encodeBool:self.isInFavorites forKey:kIsInFavorites];
    [aCoder encodeObject:self.grouping forKey:kGrouping];
}

- (NSString *)description
{
    return [NSString stringWithFormat:fWord, self.wordId, self.name, self.grouping, self.isInFavorites];
}

@end