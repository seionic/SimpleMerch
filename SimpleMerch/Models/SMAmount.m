//
//  SMAmount.m
//  SimpleMerch
//
//  Created by Seiler Hagan on 6/4/16.
//  Copyright © 2016 Seiler Hagan. All rights reserved.
//

#import "SMAmount.h"

static NSString *const kSmaAmountValue = @"amountValue";
static NSString *const kSmaAmountTitle = @"amountTitle";

@implementation SMAmount

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (!self) {
        return  nil;
    }

    _amountValue = [aDecoder decodeObjectForKey:kSmaAmountValue];
    _amountTitle = [aDecoder decodeObjectForKey:kSmaAmountTitle];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.amountValue forKey:kSmaAmountValue];
    [aCoder encodeObject:self.amountTitle forKey:kSmaAmountTitle];
}

@end
