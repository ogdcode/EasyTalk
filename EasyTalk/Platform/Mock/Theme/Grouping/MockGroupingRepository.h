//
//  MockGroupingRepository.h
//  EasyTalk
//
//  Created by Olivier Gonçalves on 27/11/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IGroupingRepository.h"
#import "Constants.h"

@interface MockGroupingRepository : NSObject <IGroupingRepository>
{
    @private
    NSMutableArray<Grouping *> *mockList_;
}
@property (strong, nonatomic) NSMutableArray<Grouping *> *mockList;

@end
