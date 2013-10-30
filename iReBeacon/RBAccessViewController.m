//
//  RBViewController.m
//  iReBeacon
//
//  Created by Giuseppe Macrì on 10/17/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import "RBAccessViewController.h"

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


#pragma mark - FB Access

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    
}

/*!
 @abstract
 Tells the delegate that the view is has now fetched user info
 
 @param loginView   The login view that transitioned its view mode
 
 @param user        The user info object describing the logged in user
 */
- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user {
    NSLog(@"Logged in!");
    [self performSegueWithIdentifier:@"LOGIN_SEGUE" sender:self];
}

/*!
 @abstract
 Tells the delegate that the view is now in logged out mode
 
 @param loginView   The login view that transitioned its view mode
 */
- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    
}

/*!
 @abstract
 Tells the delegate that there is a communication or authorization error.
 
 @param loginView           The login view that transitioned its view mode
 @param error               An error object containing details of the error.
 @discussion See https://developers.facebook.com/docs/technical-guides/iossdk/errors/
 for error handling best practices.
 */
- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
    NSLog(@"Error: %@",[error localizedDescription]);
}

@end
