//
//  Word.h
//  EasyTalk
//
//  Created by Olivier Gonçalves on 20/11/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Grouping.h"

#define kWordId @"WORD_ID"
#define kGrouping @"GROUPING"
#define fWord @"Word #%@[Name:%@,%@,Favorited:%d"

@interface Word : NSObject <NSCoding>
{
    @private
    NSString *name_;
    NSNumber *wordId_;
    BOOL isInFavorites_;
    Grouping *grouping_;
}
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *wordId;
@property (assign, nonatomic) BOOL isInFavorites;
@property (strong, nonatomic) Grouping *grouping;

- (id)initWithName:(NSString *)name id:(NSNumber *)wordId grouping:(Grouping *)grouping;
- (BOOL)isEqualToWord:(Word *)w;
- (BOOL)isInSameGroupingAs:(Word *)w;

@end