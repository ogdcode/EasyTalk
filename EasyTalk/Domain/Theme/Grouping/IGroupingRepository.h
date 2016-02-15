//
//  IGroupingRepository.h
//  EasyTalk
//
//  Created by Olivier Gonçalves on 20/11/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Grouping.h"

@protocol IGroupingRepository <NSObject>

@required
- (void)saveGrouping:(Grouping *)grp;
- (void)deleteGrouping:(Grouping *)grp;
- (Grouping *)getGroupingWithName:(NSString *)name;
- (NSArray<Grouping *> *)getGroupingList;
- (NSArray<Grouping *> *)getFavoriteGroupingList;
- (NSDictionary *)dictionarize:(NSArray<Grouping *> *)grpList;

@end
