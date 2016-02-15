//
//  SerializableGroupingRepository.h
//  EasyTalk
//
//  Created by Olivier Gonçalves on 27/11/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IGroupingRepository.h"
#import "Constants.h"

@interface SerializableGroupingRepository : NSObject <IGroupingRepository>
{
    @private
    NSString *filePath_;
    NSMutableArray<Grouping *> *groupingList_;
}
@property (strong, nonatomic) NSString *filePath;
@property (strong, nonatomic) NSMutableArray<Grouping *> *groupingList;

- (instancetype)initWithFileName:(NSString *)fileName;

@end
