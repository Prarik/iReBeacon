//
//  CLBeacon+toDictionary.m
//  iReBeacon
//
//  Created by Giuseppe Macrì on 10/31/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import "CLBeacon+toDictionary.h"

@implementation CLBeacon (toDictionary)

- (NSDictionary *)toDictionary {
    
    NSString *proximity = @"";
    switch (self.proximity) {
        case CLProximityFar:
            proximity = @"CLProximityFar";
            break;
        case CLProximityNear:
            proximity = @"ProximityNear";
            break;
        case CLProximityImmediate:
            proximity = @"ProximityImmediate";
            break;
        case CLProximityUnknown:
        default:
            proximity = @"ProximityUnknown";
            break;
    }

    
    NSDictionary *dictionary = @{
                                 @"major": self.major,
                                 @"minor": self.minor,
                                 @"accuracy": [NSNumber numberWithDouble:self.accuracy],
                                 @"proximity": proximity,
                                 @"rssi": [NSNumber numberWithInt:self.rssi]};
    
    return dictionary;
}


@end
