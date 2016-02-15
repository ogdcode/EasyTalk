//
//  WKInterfaceController+DataExchange.m
//  EasyTalk
//
//  Created by Olivier Gonçalves on 01/12/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import <WatchConnectivity/WatchConnectivity.h>
#import "WKInterfaceController+DataExchange.h"
#import "Constants.h"

@implementation WKInterfaceController (DataExchange)

- (NSDictionary *)getUserinfoAtFile:(NSString *)archive
{
    NSString* documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSString* filePath = [documentPath stringByAppendingPathComponent:archive];
    NSDictionary* userInfo = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    return userInfo;
}

- (void)sendMessageCode:(NSString *)code
{
    NSDictionary *msg = @{CODE : code};
    [[WCSession defaultSession] sendMessage:msg replyHandler:nil errorHandler:nil];
}

@end
