//
//  RBProduct.h
//  iReBeacon
//
//  Created by Giuseppe Macrì on 10/18/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import <Parse/Parse.h>

@interface RBProduct : PFObject<PFSubclassing>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *brand;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *department;
@property (strong, nonatomic) NSString *pictureURL;

@property (nonatomic) BOOL featured;

+ (NSString *)parseClassName;

@end
