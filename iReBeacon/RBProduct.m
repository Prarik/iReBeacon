//
//  RBProduct.m
//  iReBeacon
//
//  Created by Giuseppe Macrì on 10/18/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import "RBProduct.h"

@implementation RBProduct

@dynamic name;
@dynamic brand;
@dynamic description;
@dynamic department;

@dynamic featured;

+ (NSString *)parseClassName {
    return @"Product";
}

@end
