//
//  Grouping.m
//  EasyTalk
//
//  Created by Olivier Gonçalves on 20/11/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import "Grouping.h"

@implementation Grouping

@synthesize name = name_, grpId = grpId_, isInFavorites = isInFavorites_;

- (id)initWithName:(NSString *)name id:(NSNumber *)grpId
{
    if ((self = [super init])) {
        self.name = name;
        self.grpId = grpId;
        self.isInFavorites = NO;
    }
    
    return self;
}

- (BOOL)isEqualToGrouping:(Grouping *)grp
{
    return [self.name isEqualToString:grp.name];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super init])) {
        self.name = [aDecoder decodeObjectForKey:kName];
        self.grpId = [aDecoder decodeObjectForKey:kGrpId];
        self.isInFavorites = [aDecoder decodeBoolForKey:kIsInFavorites];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:kName];
    [aCoder encodeObject:self.grpId forKey:kGrpId];
    [aCoder encodeBool:self.isInFavorites forKey:kIsInFavorites];
}

- (NSString *)description
{
    return [NSString stringWithFormat:fGrouping, self.grpId, self.name, self.isInFavorites];
}

@end
