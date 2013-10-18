//
//  RBDeal.m
//  iReBeacon
//
//  Created by Giuseppe Macrì on 10/18/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import "RBDeal.h"

@implementation RBDeal

@dynamic code;
@dynamic product;
@dynamic description;
@dynamic pictureURL;
@dynamic lastDay;


+ (NSString *)parseClassName {
    return @"Deal";
}

@end
