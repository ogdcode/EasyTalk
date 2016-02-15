//
//  FavoriteViewController.h
//  EasyTalk
//
//  Created by Etudiant on 08/10/2015.
//  Copyright © 2015 Etudiant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoriteViewController : UIViewController{
    
    @private
    NSString* kCellIdentifier;
    NSMutableArray* FavoriteItem;
    NSArray* Item;
}



@property (weak, nonatomic) IBOutlet UITableView *FavoriteTable;
@property (weak, nonatomic) IBOutlet UIImageView *image;





@end
