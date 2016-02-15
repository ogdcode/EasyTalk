//
//  AddWordViewController.h
//  EasyTalk
//
//  Created by Etudiant on 08/10/2015.
//  Copyright © 2015 Etudiant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Grouping.h"
#import "IWordRepository.h"
#import "MockWordRepository.h"

@interface AddWordViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *TFNameGroup;
@property (weak, nonatomic) IBOutlet UITextField *TFNameWord;

@end
