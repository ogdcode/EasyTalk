//
//  InterfaceController.m
//  EasyTalk WatchKit Extension
//
//  Created by Olivier Gonçalves on 20/11/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import "WKInterfaceController+DataExchange.h"
#import "InterfaceController.h"
#import "Constants.h"

@interface InterfaceController()

@end

@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [super sendMessageCode:START];
}

- (void)willActivate {
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)onTouchEVoice {
    [self pushControllerWithName:EVOICTRL context:nil];
}

- (IBAction)onTouchEWord {
    [self pushControllerWithName:EWRDCTRL context:nil];
}

- (IBAction)onTouchHelp {
    [self pushControllerWithName:HELPCTRL context:nil];
}


@end



