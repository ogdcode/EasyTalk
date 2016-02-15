//
//  Grouping.h
//  EasyTalk
//
//  Created by Olivier Gonçalves on 20/11/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kName @"NAME"
#define kGrpId @"GRP_ID"
#define kIsInFavorites @"IS_IN_FAVORITES"
#define fGrouping @"Grouping #%@[Name:%@,Favorited:%d]"

@interface Grouping : NSObject <NSCoding>
{
    @private
    NSString *name_;
    NSNumber *grpId_;
    BOOL isInFavorites_;
}
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *grpId;
@property (assign, nonatomic) BOOL isInFavorites;

- (id)initWithName:(NSString *)name id:(NSNumber *)grpId;
- (BOOL)isEqualToGrouping:(Grouping *)grp;

@end
