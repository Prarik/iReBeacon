//
//  Common.h
//  iReBeacon
//
//  Created by Giuseppe Macri on 10/23/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#ifndef iReBeacon_Common_h
#define iReBeacon_Common_h

// Facebook SDK
#import <FacebookSDK/FacebookSDK.h>

static NSString *kBeaconUUID = @"BD662418-0368-49EC-A9BC-7C43D1D14A10";
static NSString *kBeaconRegionIdentifier = @"com.giuseppem.iReBeacon";
static NSString *kLocationUpdateNotification = @"updateNotification";
static NSString *kClosestBeaconNotification = @"closestBeaconNotification";
static NSString *kBeaconListNotification = @"beaconListNotification";
static NSString *kEnterBeaconRegion = @"enterBeaconRegion";
static NSString *kExitBeaconRegion = @"exitBeaconRegion";

typedef NS_ENUM(NSUInteger, RBApplicationMode) {
    RBApplicationModePeripheral = 0,
    RBApplicationModeRegionMonitoring
};

#endif
