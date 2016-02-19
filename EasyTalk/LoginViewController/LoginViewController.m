//
//  LoginViewController.m
//  EasyTalk
//
//  Created by super on 2/17/16.
//  Copyright © 2016 Chips&Chips. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendBtnTapped:(UIButton *)sender {
    
    
    //check if userNameField and userPasswordField is empty or not.
    if (self.userNameTextField.text && self.userNameTextField.text.length > 0 && self.userPasswordTextField.text && self.userPasswordTextField.text.length > 0)
    {
        NSString *userName = self.userNameTextField.text;  //get user name
        NSString *userPassword = self.userPasswordTextField.text;  //get password
        
        NSURL *URL = [NSURL URLWithString:@"https://salty-oasis-72889.herokuapp.com/oauth/token"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
        // Set request type
        request.HTTPMethod = @"POST";
        
        // Set params to be sent to the server
        
        NSString *params = [NSString stringWithFormat:@"grant_type=password&client_id=HJt6Ni9kQy1teMKUbciuSaNkNMMxtQGg&username=%@&password=%@", userName, userPassword];
        
        NSLog(@"%@", params);   //print params
        // Encoding type
        NSData *data = [params dataUsingEncoding:NSUTF8StringEncoding];
        // Add values and contenttype to the http header
        [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setHTTPBody:data];
        
        // Send the request
        NSURLSession *session = [NSURLSession sharedSession];
        
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
        {
            // do something with the data
            
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            if ([httpResponse statusCode] == 200){
                
                NSString *return_data = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
                NSLog(@"%@", return_data);
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Obtention du token" message:@"Couple login / mot de passe correct !" preferredStyle:UIAlertControllerStyleAlert];
                    
                    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                    [alertController addAction:ok];
                    
                    [self presentViewController:alertController animated:YES completion:nil];

                });
            }
            
            else{

                NSLog(@"%@", response);
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Erreur" message: @"Couple login / mot de passe incorrect !" preferredStyle:UIAlertControllerStyleAlert];
                    
                    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                    [alertController addAction:ok];
                    
                    [self presentViewController:alertController animated:YES completion:nil];

                });
                
            }
            

        }];
        
        [dataTask resume];

    }
    else
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Erreur" message:@"Login et mot de passe sont requis." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
    
}


@end
