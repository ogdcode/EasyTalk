//
//  AddGroupingViewController.m
//  EasyTalk
//
//  Created by Etudiant on 08/10/2015.
//  Copyright © 2015 Etudiant. All rights reserved.
//

#import "AddGroupingViewController.h"

@interface AddGroupingViewController ()

@end

@implementation AddGroupingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClickAdd:(id)sender {
    
    NSString* name = self.TFNameGroup.text;
    //NSString* idGroup = self.TFNumberID.text;
    Grouping* gr = [[Grouping alloc] init];
    gr.name = name;
    /*NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *myNumber = [f numberFromString:idGroup];
    gr.grpId = myNumber;*/
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
