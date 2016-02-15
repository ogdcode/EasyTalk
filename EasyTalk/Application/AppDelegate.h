//
//  AppDelegate.h
//  EasyTalk
//
//  Created by Olivier Gonçalves on 20/11/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IGroupingRepository.h"
#import "IWordRepository.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, readonly) id<IGroupingRepository> groupingRepository;
@property (nonatomic, readonly) id<IWordRepository> wordRepository;

@end

