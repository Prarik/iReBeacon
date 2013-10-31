//
//  BTBeaconRegion.m
//  beacon-transmitter
//
//  Created by Giuseppe Macrì on 10/26/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import "RBBeaconRegion.h"

static RBBeaconRegion *_sharedInstance = nil;

@implementation RBBeaconRegion

+ (instancetype)targetRegion {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[RBBeaconRegion alloc] init];
    });
    return _sharedInstance;
}

- (id)init {
    
    self = [super initWithProximityUUID:[[NSUUID alloc] initWithUUIDString:kBeaconUUID] major:1 minor:1 identifier:kBeaconRegionIdentifier];
    
    if (self) {
        self.notifyEntryStateOnDisplay = YES;     // only notify user if app is active
        self.notifyOnEntry = YES;                 // don't notify user on region entrance
        self.notifyOnExit = YES;                 // notify user on region exit
    }
    
    return self;
}

@end
