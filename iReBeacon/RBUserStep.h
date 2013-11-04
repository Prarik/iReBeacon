//
//  RBUserStep.h
//  iReBeacon
//
//  Created by Giuseppe Macrì on 10/31/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import <Parse/Parse.h>

@interface RBUserStep : PFObject<PFSubclassing>

@property (strong, nonatomic) PFUser *user;
@property (strong, nonatomic) NSString *step;

+ (NSString *)parseClassName;

- (id)initWithUser:(PFUser *)user withStep:(NSString *)beaconsJSON;

@end
