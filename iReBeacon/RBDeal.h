//
//  RBDeal.h
//  iReBeacon
//
//  Created by Giuseppe Macrì on 10/18/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import <Parse/Parse.h>

@interface RBDeal : PFObject<PFSubclassing>

@property (strong, nonatomic) NSString *code;
@property (strong, nonatomic) NSString *product;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *pictureURL;
@property (strong, nonatomic) NSDate *lastDay;

+ (NSString *)parseClassName;

@end
