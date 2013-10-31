//
//  RBBeaconHandler.m
//  iReBeacon
//
//  Created by Giuseppe Macrì on 10/29/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import "RBBeaconHandler.h"
#import <Parse/Parse.h>
#import "CLBeacon+toDictionary.h"

@interface RBBeaconHandler ()

@property (strong, nonatomic) NSArray *beacons;

@property (nonatomic) NSInteger counter;
@property (nonatomic) BOOL uploading;

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
        self.counter = 0;
        self.uploading = NO;
        // add observer for beacons
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(handleBeaconUpdate:)
                                                     name:kBeaconListNotification
                                                   object:nil];
        
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(handleEnterRegion:)
//                                                     name:kEnterBeaconRegion
//                                                   object:nil];
//        
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(handleExitRegion:)
//                                                     name:kExitBeaconRegion
//                                                   object:nil];
    }
    return self;
}


- (void)handleEnterRegion:(NSNotification*)notification {
    CLBeaconRegion *region = notification.userInfo[@"region"];
    
    NSLog(@"Entering region: %@", region);
}

- (void)handleExitRegion:(NSNotification*)notification {
    CLBeaconRegion *region = notification.userInfo[@"region"];
    
    NSLog(@"Entering region: %@", region);
}



- (void)handleBeaconUpdate:(NSNotification*)notification {
    self.beacons = notification.userInfo[@"beacons"];
    self.counter++;
    if (self.counter > 10 && !self.uploading) {
        self.counter = 0;
        [self syncBeacons];
    }
}

- (void)syncBeacons {
    
    self.uploading = YES;
    
    NSError *error;
    
    NSMutableArray *beaconsArray = [NSMutableArray array];
    for (CLBeacon *beacon in self.beacons) {
        [beaconsArray addObject:[beacon toDictionary]];
    }
    NSData *beaconsData = [NSJSONSerialization dataWithJSONObject:beaconsArray options:kNilOptions error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:beaconsData encoding:NSUTF8StringEncoding];
    NSLog(@"json: %@", jsonString);
    

    self.uploading = NO;    
}


@end
