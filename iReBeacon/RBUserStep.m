//
//  RBUserStep.m
//  iReBeacon
//
//  Created by Giuseppe Macrì on 10/31/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import "RBUserStep.h"

@implementation RBUserStep

@dynamic user;
@dynamic step;

+ (NSString *)parseClassName {
    return @"UserStep";
}

- (id)initWithUser:(PFUser *)user withStep:(NSString *)beaconsJSON {
    self = [super init];
    if (self) {
        self.user = user;
        self.step = beaconsJSON;
    }
    return self;
}

@end
