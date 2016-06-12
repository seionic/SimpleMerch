//
//  NSString+Additions.m
//  SimpleMerch
//
//  Created by Seiler Hagan on 6/11/16.
//  Copyright © 2016 Seiler Hagan. All rights reserved.
//

#import "NSString+Additions.h"

@implementation NSString (Additions)


+ (BOOL)isEmptyString:(NSString *)string {
    return !string || string.length == 0;
}

@end
