//
//  RBProductDetail.h
//  iReBeacon
//
//  Created by John on 11/1/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RBProductDetail : NSObject

@property (strong, nonatomic) NSString *productImageURL;
@property (strong, nonatomic) NSString *productName;
@property (strong, nonatomic) NSString *productBrand;
@property (strong, nonatomic) NSString *productDescription;
@property (strong, nonatomic) NSString *featuredProduct;

@end
