//
//  RBProductDetailViewController.m
//  iReBeacon
//
//  Created by John on 11/4/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import "RBProductDetailViewController.h"
#import "UIImageView+AFNetworking.h"

@interface RBProductDetailViewController ()

@end

@implementation RBProductDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.productBrand.text = self.productDetail.productBrand;
    self.productDescription.text = self.productDetail.productDescription;
    self.productName.text = self.productDetail.productName;
    
    NSURL *imageURL = [NSURL URLWithString:self.productDetail.productImageURL];
    if (imageURL) {
        [self.productImage setImageWithURL:imageURL];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
