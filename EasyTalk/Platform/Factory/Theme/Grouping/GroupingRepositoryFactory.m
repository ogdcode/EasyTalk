//
//  GroupingRepositoryFactory.m
//  EasyTalk
//
//  Created by Olivier Gonçalves on 27/11/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import "GroupingRepositoryFactory.h"
#import "SerializableGroupingRepository.h"
#import "MockGroupingRepository.h"

static GroupingRepositoryFactory *sharedInstance_ = nil;

@implementation GroupingRepositoryFactory

+ (instancetype)sharedInstance
{
    if (sharedInstance_ == nil) {
        sharedInstance_ = [GroupingRepositoryFactory new];
    }
    
    return sharedInstance_;
}

- (id<IGroupingRepository>)groupingRepository
{
    if (!groupingRepository_) {
        groupingRepository_ = [MockGroupingRepository new];
    }
    
    return groupingRepository_;
}

@end
