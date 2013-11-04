//
//  RBBeaconHandler.m
//  iReBeacon
//
//  Created by Giuseppe Macrì on 10/29/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import "RBBeaconHandler.h"
#import "CLBeacon+toDictionary.h"

#import "RBUserStep.h"
#import "RBCoupon.h"
#import "RBUserCoupon.h"

@interface RBBeaconHandler ()

@property (strong, nonatomic) NSArray *beacons;

@property (nonatomic) NSInteger counter;
@property (nonatomic) BOOL uploading;

- (void)checkCouponForUser:(PFUser *)user inDepartment:(NSString *)department;

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
        self.receivedUserCoupons = [NSMutableDictionary dictionary];
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
//        [self syncBeacons];
        [self checkUserCoupons];
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

    NSLog(@"Beacons: %@", jsonString);
    
    RBUserStep *userStep = [[RBUserStep alloc] initWithUser:[PFUser currentUser] withStep:jsonString];
    
    
    [userStep saveEventually:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"Step saved");
        } else {
            NSLog(@"Error: %@", error.description);
        }
        self.uploading = NO;
    }];
    
}

- (void)checkUserCoupons {
    NSString *departmentId = @"";
    for (CLBeacon *beacon in self.beacons) {
        
        departmentId = [NSString stringWithFormat:@"%@-%@", beacon.major, beacon.minor];
        // Parse integration for coupon
        NSString *department = @"Smartphones";
        if ([departmentId isEqualToString:@"1-2"]) {
            department = @"Computers";
        } else if ([departmentId isEqualToString:@"1-3"]) {
            department = @"Software";
        } else if ([departmentId isEqualToString:@"1-4"]) {
            department = @"Peripherals";
        }
        
        if (beacon.proximity == CLProximityImmediate || beacon.proximity == CLProximityNear) {
            
            if (![self.receivedUserCoupons objectForKey:department]) {
                [self checkCouponForUser:[PFUser currentUser] inDepartment:department];
            }
            
            break;
        }
    }
}

- (void)checkCouponForUser:(PFUser *)user inDepartment:(NSString *)department {
    
    PFQuery *query = [PFQuery queryWithClassName:@"Coupon"];
    [query whereKey:@"department" equalTo:department];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            RBCoupon *coupon = [objects firstObject];
            [self.receivedUserCoupons setObject:coupon forKey:department];
            
            NSString *description = [NSString stringWithFormat:@"%@: %@", department, [coupon objectForKey:@"description"]];
            
            RBUserCoupon *userCoupon = [[RBUserCoupon alloc] initWithUser:user withCoupon:coupon];
            [userCoupon saveEventually:^(BOOL succeeded, NSError *error) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Coupon"
                                                                    message:description
                                                                   delegate:self
                                                          cancelButtonTitle:@"Thanks"
                                                          otherButtonTitles:nil];
                [alertView show];
            }];
        }
    }];
}



@end
