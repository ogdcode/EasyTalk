//
//  GroupingRepositoryFactory.h
//  EasyTalk
//
//  Created by Olivier Gonçalves on 27/11/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IGroupingRepository.h"

@interface GroupingRepositoryFactory : NSObject
{
    @private
    id<IGroupingRepository> groupingRepository_;
}

+ (instancetype)sharedInstance;

- (id<IGroupingRepository>)groupingRepository;

@end
