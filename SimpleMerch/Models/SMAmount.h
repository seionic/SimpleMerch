//
//  SMAmount.h
//  SimpleMerch
//
//  Created by Seiler Hagan on 6/4/16.
//  Copyright © 2016 Seiler Hagan. All rights reserved.
//

@import Foundation;

@interface SMAmount : NSObject <NSCoding>
@property (nonnull, nonatomic ) NSNumber *amountValue;
@property (nullable, nonatomic) NSString *amountTitle;
@end
