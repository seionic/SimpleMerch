//
//  SMCategoryCollectionViewCell.h
//  SimpleMerch
//
//  Created by Seiler Hagan on 6/4/16.
//  Copyright © 2016 Seiler Hagan. All rights reserved.
//

@import UIKit;

@interface SMCategoryCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *categoryImage;
@property (weak, nonatomic) IBOutlet UILabel *categoryName;
@property (weak, nonatomic) IBOutlet UILabel *categoryAmounts;
@end
