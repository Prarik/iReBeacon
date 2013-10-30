//
//  BTLocationManager.h
//  beacon-transmitter
//
//  Created by Giuseppe Macrì on 10/26/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface RBLocationManager : NSObject<CLLocationManagerDelegate>

+ (id)sharedManager;

- (void)initializePeripheralManager;

- (void)initializeRegionMonitoring;

- (void)stopMonitoringForRegion:(CLBeaconRegion*)region;

- (void)stopAdvertisingBeacon;

@end
