//
//  RBBeaconHandler.m
//  iReBeacon
//
//  Created by Giuseppe Macrì on 10/29/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import "RBBeaconHandler.h"

@interface RBBeaconHandler ()

@property (strong, nonatomic) NSArray *beacons;

@end


static RBBeaconHandler *_sharedInstance = nil;

@implementation RBBeaconHandler

+ (instancetype)sharedHanlder {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[RBBeaconHandler alloc] init];
    });
    return _sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        // add observer for beacons
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(hanldeBeaconUpdate:)
                                                     name:kBeaconListNotification
                                                   object:nil];
    }
    return self;
}

- (void)hanldeBeaconUpdate:(NSNotification*)notification {
    
    NSArray *beacons = notification.userInfo[@"beacons"];
    
    NSLog(@"%@", beacons);
}

@end
