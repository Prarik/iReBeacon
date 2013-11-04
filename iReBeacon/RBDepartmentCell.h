//
//  RBDepartmentCell.h
//  iReBeacon
//
//  Created by John on 10/31/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import <Parse/Parse.h>

@interface RBDepartmentCell : PFTableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *departmentImage;
@property (weak, nonatomic) IBOutlet UILabel *departmentName;
@property (weak, nonatomic) IBOutlet UILabel *departmentDescription;

@end
