//
//  RBDealListCell.h
//  iReBeacon
//
//  Created by zhi on 10/30/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface RBDealListCell : UITableViewCell //PFTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *productLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIView *codeLabel;

@end
