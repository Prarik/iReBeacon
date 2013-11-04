//
//  RBProductDetailViewController.h
//  iReBeacon
//
//  Created by John on 11/4/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RBProductDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *productBrand;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *productDescription;

@end
