//
//  EvoiceInterfaceController.m
//  EasyTalk
//
//  Created by Olivier Gonçalves on 03/12/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import "EvoiceInterfaceController.h"

#define logResults @"results:"

@interface EvoiceInterfaceController ()

@end

@implementation EvoiceInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)onTouchActivate {
    [self presentTextInputControllerWithSuggestions:nil allowedInputMode:WKTextInputModePlain completion:^(NSArray *results) {
        NSLog(@"%@ %@", logResults, results);
    }];
}

@end



