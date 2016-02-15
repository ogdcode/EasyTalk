//
//  FavoriteViewController.m
//  EasyTalk
//
//  Created by Etudiant on 08/10/2015.
//  Copyright © 2015 Etudiant. All rights reserved.
//

#import "FavoriteViewController.h"
#import "Grouping.h"
#import "Word.h"

@interface FavoriteViewController () <UITableViewDataSource, UITableViewDelegate>{

}

@end

@implementation FavoriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    kCellIdentifier = @"Favorite";
   // [self.FavoriteImage setImage:[UIImage imageNamed:@"etoilefav pleine"]];
    Item = @[@"Boulangerie", @"Boucherie", @"Transport", @"Restaurant", @"Musique"];
    FavoriteItem = [NSMutableArray new]; // lecture de fichier
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return Item.count;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = Item[indexPath.row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    UIImageView* image = (UIImageView*)[cell viewWithTag:1];
    if([FavoriteItem containsObject:cell.textLabel.text]) {
        [image setImage:[UIImage imageNamed:@"etoilevide"]];
        [FavoriteItem removeObject:cell.textLabel.text];
        NSLog(@"%@", FavoriteItem);
    } else {
        [image setImage:[UIImage imageNamed:@"etoilePleine"]];
        [FavoriteItem addObject:cell.textLabel.text];
        NSLog(@"%@", FavoriteItem);
    }
}




/*
func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as! UITableViewCell
    
    let rowData: NSDictionary = (self.Apartementitem[indexPath.row] as? NSDictionary)!
    
    cell.textLabel!.text = rowData["reference"] as? String
    
    
    return cell
}

func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    // obtenir les données pour la ligne sélectionée
    
    let rowData: NSDictionary = (self.Apartementitem[indexPath.row] as? NSDictionary)!
    id = rowData["id"] as! String
    self.detailApartementViewController?.api.recupDetails(id)
    
}*/


@end
