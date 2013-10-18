//
//  RBCoupon.m
//  iReBeacon
//
//  Created by Giuseppe Macrì on 10/18/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import "RBCoupon.h"

@implementation RBCoupon

@dynamic code;
@dynamic product;
@dynamic description;
@dynamic pictureUrl;
@dynamic lastDay;


+ (NSString *)parseClassName {
    return @"Coupon";
}

@end
