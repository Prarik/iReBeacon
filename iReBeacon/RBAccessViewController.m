//
//  RBViewController.m
//  iReBeacon
//
//  Created by Giuseppe Macrì on 10/17/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import "RBAccessViewController.h"
#import <Parse/Parse.h>

@interface RBAccessViewController () <FBLoginViewDelegate>

@end

@implementation RBAccessViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLoginClick:(id)sender {
    [PFFacebookUtils logInWithPermissions:nil block:^(PFUser *user, NSError *error) {
//        if (!user) {
//            NSLog(@"Uh oh. The user cancelled the Facebook login.");
//        } else if (user.isNew) {
//            NSLog(@"User signed up and logged in through Facebook!");
//        } else {
//            NSLog(@"User logged in through Facebook!");
//        }
        if (user) {
            [self performSegueWithIdentifier:@"LOGIN_SEGUE" sender:self];
        }
    }];
}


@end
