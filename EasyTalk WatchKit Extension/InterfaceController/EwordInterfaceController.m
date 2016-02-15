//
//  EwordInterfaceController.m
//  EasyTalk
//
//  Created by Olivier Gonçalves on 03/12/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import "EwordInterfaceController.h"
#import "Constants.h"

@interface EwordInterfaceController ()

@end

@implementation EwordInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)onTouchFavorites {
    [self pushControllerWithName:FAVSCTRL context:nil];
}

- (IBAction)onTouchGroupings {
    [self pushControllerWithName:GRPGCTRL context:nil];
}


@end



