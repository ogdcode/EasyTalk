//
//  GroupingInterfaceController.h
//  EasyTalk
//
//  Created by Olivier Gonçalves on 03/12/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface GroupingInterfaceController : WKInterfaceController
{
    @private
    NSDictionary *userInfo_;
}
@property (strong, nonatomic) IBOutlet WKInterfaceTable *table;
@property (strong, nonatomic) NSDictionary *userInfo;

- (void)configure;

@end
