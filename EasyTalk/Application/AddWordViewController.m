//
//  AddWordViewController.m
//  EasyTalk
//
//  Created by Etudiant on 08/10/2015.
//  Copyright © 2015 Etudiant. All rights reserved.
//

#import "AddWordViewController.h"

@interface AddWordViewController ()

@end

@implementation AddWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClickAdd:(id)sender {
    
    NSString* name = self.TFNameWord.text;
   // NSString* idGroup = self.TFNumberID.text;
    Grouping* nameGroup;
    nameGroup.name = self.TFNameGroup.text;
    Word* w = [[Word alloc] init];
    w.name = name;
   /* NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *myNumber = [f numberFromString:idGroup];
    w.wordId = myNumber;*/
    
    
    
    
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
