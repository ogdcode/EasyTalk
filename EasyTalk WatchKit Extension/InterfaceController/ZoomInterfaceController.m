//
//  ZoomInterfaceController.m
//  EasyTalk
//
//  Created by Olivier Gonçalves on 03/12/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import "ZoomInterfaceController.h"

@interface ZoomInterfaceController ()

@end

@implementation ZoomInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    NSString *word = context;
    [self setLabel:word];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (void)setLabel:(NSString *)name
{
    [self.detailLabel setText:name];
}

@end



