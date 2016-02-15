//
//  WordInterfaceController.m
//  EasyTalk
//
//  Created by Olivier Gonçalves on 03/12/2015.
//  Copyright © 2015 Chips&Chips. All rights reserved.
//

#import "WKInterfaceController+DataExchange.h"
#import "WordInterfaceController.h"
#import "RowController.h"
#import "Constants.h"

@interface WordInterfaceController ()
{
    NSMutableArray* items_;
}
@property(strong, nonatomic) NSMutableArray* items;

@end

@implementation WordInterfaceController

@synthesize userInfo = userInfo_, selectedGrp = selectedGrp_, items = items_;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    self.userInfo = [super getUserinfoAtFile:ARCHIVE];
    self.selectedGrp = context;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    [self configure];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (void)configure
{
    self.items = [NSMutableArray new];
    NSUInteger length = [self.userInfo count], rowIndex = 0;
    for (NSUInteger i = 0; i < length; ++i) {
        NSString *value = [self.userInfo objectForKey:[NSString stringWithFormat:@"%@ #%u(%@)", WORD, i+1, self.selectedGrp]];
        NSString *valueF = [self.userInfo objectForKey:[NSString stringWithFormat:@"%@ #%u(%@)", FAVWORD, i+1, self.selectedGrp]];
        NSString *item = (value != nil) ? value : valueF;
        if (item != nil) {
            [self.items addObject:item];
            rowIndex++;
        }
    }
    [self.table setNumberOfRows:rowIndex withRowType:ROW];
    for (NSUInteger i = 0; i < rowIndex; ++i) {
        RowController *rowController = [self.table rowControllerAtIndex:i];
        [rowController setLabel:[self.items objectAtIndex:i]];
    }
    [self.labelGrp setText:self.selectedGrp];
}

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex
{
    NSString *value = [self.items objectAtIndex:rowIndex];
    [self pushControllerWithName:ZOOMCTRL context:value];
}

@end



