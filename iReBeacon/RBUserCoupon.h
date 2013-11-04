//
//  RBUserCopuon.h
//  iReBeacon
//
//  Created by Giuseppe Macrì on 11/3/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import <Parse/Parse.h>

@interface RBUserCoupon : PFObject<PFSubclassing>

@property (strong, nonatomic) PFUser *user;
@property (strong, nonatomic) PFObject *coupon;
@property (nonatomic) BOOL used;

+ (NSString *)parseClassName;

- (id)initWithUser:(PFUser *)user withCoupon:(PFObject *)coupon;

@end
