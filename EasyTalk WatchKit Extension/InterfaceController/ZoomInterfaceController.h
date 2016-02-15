//
//  ZoomInterfaceController.h
//  EasyTalk
//
//  Created by Olivier Gonçalves on 03/12/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface ZoomInterfaceController : WKInterfaceController

@property (strong, nonatomic) IBOutlet WKInterfaceLabel *detailLabel;

- (void)setLabel:(NSString *)name;

@end
