//
//  RBDepartment.h
//  iReBeacon
//
//  Created by Giuseppe Macrì on 10/18/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import <Parse/Parse.h>

@interface RBDepartment : PFObject<PFSubclassing>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *pictureUrl;

+ (NSString *)parseClassName;

@end
