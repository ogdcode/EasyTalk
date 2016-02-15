//
//  WKInterfaceController+DataExchange.h
//  EasyTalk
//
//  Created by Olivier Gonçalves on 01/12/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import <WatchKit/WatchKit.h>

@interface WKInterfaceController (DataExchange)

- (NSDictionary *)getUserinfoAtFile:(NSString *)archive;
- (void)sendMessageCode:(NSString *)code;

@end
