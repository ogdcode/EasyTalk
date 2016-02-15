//
//  ViewController.m
//  EasyTalk
//
//  Created by Olivier Gonçalves on 20/11/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import <WatchConnectivity/WatchConnectivity.h>
#import "GroupingRepositoryFactory.h"
#import "WordRepositoryFactory.h"
#import "ViewController.h"

@interface ViewController () <WCSessionDelegate>

@end

@implementation ViewController

@dynamic groupingRepository, wordRepository;

- (id<IGroupingRepository>)groupingRepository
{
    return [[GroupingRepositoryFactory sharedInstance] groupingRepository];
}

- (id<IWordRepository>)wordRepository
{
    return [[WordRepositoryFactory sharedInstance] wordRepository];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
