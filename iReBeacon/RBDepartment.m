//
//  RBDepartment.m
//  iReBeacon
//
//  Created by Giuseppe Macrì on 10/18/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import "RBDepartment.h"

@implementation RBDepartment

@dynamic name;
@dynamic description;
@dynamic pictureUrl;

+ (NSString *)parseClassName {
    return @"Department";
}

@end
