//
//  RBHomeViewController.m
//  iReBeacon
//
//  Created by Giuseppe Macrì on 10/29/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import "RBHomeViewController.h"
#import "RBLocationManager.h"

#import "RBAppDelegate.h"

@interface RBHomeViewController ()
@property (weak, nonatomic) IBOutlet UITextView *beaconInformationLabel;

@end

@implementation RBHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        [RBAppDelegate appDelegate].applicationMode = RBApplicationModeRegionMonitoring;
        
        // Init beacon region manager monitoring
        [[RBLocationManager sharedManager] initializeRegionMonitoring];
        
        // add observer for location notifications
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(handleStatusUpdate:)
//                                                     name:kLocationUpdateNotification
//                                                   object:nil];
        
        // add observer for beacons
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(hanldeBeaconUpdate:)
                                                     name:kClosestBeaconNotification
                                                   object:nil];


    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)updateUIWithBeacon:(CLBeacon *)beacon {
    
    NSString *proximity = @"";
    switch (beacon.proximity) {
        case CLProximityFar:
            proximity = @"ProximityFar";
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
    };
    
    self.beaconInformationLabel.text = [NSString stringWithFormat:@"Major: %@\nMinor: %@\nAccuracy: %0.2f\nProximity: %@\nRSSI: %li",
                                            beacon.major,
                                            beacon.minor,
                                            beacon.accuracy,
                                            proximity,
                                            (long)beacon.rssi
                                        ];
    
}

#pragma mark - Notifications

- (void)handleStatusUpdate:(NSNotification*)notification {
    
    // update status message displayed
    self.beaconInformationLabel.text = notification.userInfo[@"status"];
    
    // log message for debugging
//    NSLog(@"%@", notification.userInfo[@"status"]);
}

- (void)hanldeBeaconUpdate:(NSNotification*)notification {
    
    // update status message displayed
    [self updateUIWithBeacon:notification.userInfo[@"beacon"]];
    
    // log message for debugging
//    NSLog(@"%@", notification.userInfo[@"beacon"]);
}

@end
