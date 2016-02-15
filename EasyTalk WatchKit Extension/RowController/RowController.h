//
//  RowController.h
//  EasyTalk
//
//  Created by Olivier Gonçalves on 03/12/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface RowController : NSObject
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *rowLabel;
@property (strong, nonatomic) IBOutlet WKInterfaceImage *rowImage;

- (void)setLabel:(NSString *)name;
- (void)setImage:(NSString *)name;

@end
