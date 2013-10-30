//
//  RBAppDelegate.m
//  iReBeacon
//
//  Created by Giuseppe Macrì on 10/17/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import "RBAppDelegate.h"

// Facebook SDK
#import <FacebookSDK/FacebookSDK.h>

// Parse Framework
#import <Parse/Parse.h>
#import "RBProduct.h"
#import "RBDeal.h"
#import "RBCoupon.h"
#import "RBDepartment.h"


@implementation RBAppDelegate

+ (RBAppDelegate*)appDelegate {
    return (RBAppDelegate*)[UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    // Init Parse Framework
    [Parse setApplicationId:@"CjCCEay3GsKEOU8fSt4fXOwueFcadW3u2v8tQQvs"
                  clientKey:@"wTNipuNwfhBny33w0pdF5AwkLrrF7Ft7FlDCamvc"];
    
    // Init Parse Analytics
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    // Setting ACL
    [PFUser enableAutomaticUser];
    PFACL *defaultACL = [PFACL ACL];
    // Optionally enable public read access while disabling public write access.
    [defaultACL setPublicReadAccess:YES];
    [defaultACL setPublicWriteAccess:YES];
    [PFACL setDefaultACL:defaultACL withAccessForCurrentUser:YES];
    
    // Register parse subclasses
    [RBDepartment registerSubclass];
    [RBProduct registerSubclass];
    [RBDeal registerSubclass];
    [RBCoupon registerSubclass];
    
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return [FBSession.activeSession handleOpenURL:url];
}

@end
