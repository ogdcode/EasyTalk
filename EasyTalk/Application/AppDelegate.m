//
//  AppDelegate.m
//  EasyTalk
//
//  Created by Olivier Gonçalves on 20/11/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import <WatchConnectivity/WatchConnectivity.h>
#import "GroupingRepositoryFactory.h"
#import "WordRepositoryFactory.h"
#import "AppDelegate.h"
#import "Constants.h"

@interface AppDelegate () <WCSessionDelegate>

@end

@implementation AppDelegate

@dynamic groupingRepository, wordRepository;

- (id<IGroupingRepository>)groupingRepository
{
    return [[GroupingRepositoryFactory sharedInstance] groupingRepository];
}

- (id<IWordRepository>)wordRepository
{
    return [[WordRepositoryFactory sharedInstance] wordRepository];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    if ([WCSession class] && [WCSession isSupported]) {
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message
{
    if ([[message objectForKey:CODE] isEqualToString:START]) {
        NSDictionary *completeList = [self.wordRepository combinedDictionarize];
        if ([WCSession defaultSession].paired && [WCSession defaultSession].watchAppInstalled) {
            [[WCSession defaultSession] transferUserInfo:completeList];
        }
    }
}

@end
