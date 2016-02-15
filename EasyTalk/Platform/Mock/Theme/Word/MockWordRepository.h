//
//  MockWordRepository.h
//  EasyTalk
//
//  Created by Olivier Gonçalves on 27/11/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IWordRepository.h"

@interface MockWordRepository : NSObject <IWordRepository>
{
    @private
    NSMutableArray<Word *> *mockList_;
}
@property (strong, nonatomic) NSMutableArray<Word *> *mockList;

@end
