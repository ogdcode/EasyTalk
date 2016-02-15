//
//  RowController.m
//  EasyTalk
//
//  Created by Olivier Gonçalves on 03/12/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import "RowController.h"

@implementation RowController

- (void)setLabel:(NSString *)name
{
    [self.rowLabel setText:name];
}

- (void)setImage:(NSString *)name
{
    [self.rowImage setImageNamed:name];
}

@end
