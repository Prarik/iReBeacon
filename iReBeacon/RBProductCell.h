//
//  RBProductCell.h
//  iReBeacon
//
//  Created by John on 10/29/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import <Parse/Parse.h>

@interface RBProductCell : PFTableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *productPicture;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *productBrand;
@property (weak, nonatomic) IBOutlet UILabel *featuredProduct;

@end
