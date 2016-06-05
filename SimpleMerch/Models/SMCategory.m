//
//  SMCategory.m
//  SimpleMerch
//
//  Created by Seiler Hagan on 6/4/16.
//  Copyright © 2016 Seiler Hagan. All rights reserved.
//

#import "SMCategory.h"

static NSString *const kSmaCategoryType    = @"categoryType";
static NSString *const kSmaCategoryName    = @"categoryName";
static NSString *const kSmaCategoryImage   = @"categoryImage";
static NSString *const kSmaCategoryAmounts = @"categoryAmounts";

@implementation SMCategory

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (!self) {
        return nil;
    }

    _categoryType    = [aDecoder decodeObjectForKey:kSmaCategoryType];
    _categoryName    = [aDecoder decodeObjectForKey:kSmaCategoryName];
    _categoryImage   = [aDecoder decodeObjectForKey:kSmaCategoryImage];
    _categoryAmounts = [aDecoder decodeObjectForKey:kSmaCategoryAmounts];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.categoryType forKey:kSmaCategoryType];
    [aCoder encodeObject:self.categoryName forKey:kSmaCategoryName];
    [aCoder encodeObject:self.categoryImage forKey:kSmaCategoryImage];
    [aCoder encodeObject:self.categoryAmounts forKey:kSmaCategoryAmounts];
}

@end
