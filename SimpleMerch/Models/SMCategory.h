//
//  SMCategory.h
//  SimpleMerch
//
//  Created by Seiler Hagan on 6/4/16.
//  Copyright © 2016 Seiler Hagan. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface SMCategory : NSObject <NSCoding>
@property (nonnull, nonatomic ) NSString       *categoryType;
@property (nonnull, nonatomic ) NSString       *categoryName;
@property (nullable, nonatomic) UIImage        *categoryImage;
@property (nonnull, nonatomic ) NSMutableArray *categoryAmounts;
@end
