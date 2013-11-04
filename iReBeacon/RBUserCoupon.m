//
//  RBUserCopuon.m
//  iReBeacon
//
//  Created by Giuseppe Macrì on 11/3/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import "RBUserCoupon.h"

@implementation RBUserCoupon

@dynamic user;
@dynamic coupon;
@dynamic used;

+ (NSString *)parseClassName {
    return @"UserCoupon";
}

- (id)initWithUser:(PFUser *)user withCoupon:(PFObject *)coupon {
    self = [super init];
    if (self) {
        self.user = user;
        self.coupon = coupon;
        self.used = NO;
    }
    
    return self;
}

@end
