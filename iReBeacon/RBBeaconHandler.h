//
//  RBBeaconHandler.h
//  iReBeacon
//
//  Created by Giuseppe Macrì on 10/29/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RBBeaconHandler : NSObject

+ (instancetype)sharedHanlder;

@property (strong, nonatomic) NSMutableDictionary *receivedUserCoupons;

@end
