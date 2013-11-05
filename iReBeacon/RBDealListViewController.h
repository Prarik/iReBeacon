//
//  RBDealListViewController.h
//  iReBeacon
//
//  Created by Giuseppe Macri on 10/23/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import <Parse/Parse.h>

@interface RBDealListViewController : PFQueryTableViewController
@property (nonatomic, strong) NSMutableDictionary *cellSelectedStates;
@end
