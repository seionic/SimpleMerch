// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SMAmount.m instead.

#import "_SMAmount.h"

@implementation SMAmountID
@end

@implementation _SMAmount

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"SMAmount" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"SMAmount";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"SMAmount" inManagedObjectContext:moc_];
}

- (SMAmountID*)objectID {
	return (SMAmountID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"amountValueValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"amountValue"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic amountTitle;

@dynamic amountValue;

- (int32_t)amountValueValue {
	NSNumber *result = [self amountValue];
	return [result intValue];
}

- (void)setAmountValueValue:(int32_t)value_ {
	[self setAmountValue:@(value_)];
}

- (int32_t)primitiveAmountValueValue {
	NSNumber *result = [self primitiveAmountValue];
	return [result intValue];
}

- (void)setPrimitiveAmountValueValue:(int32_t)value_ {
	[self setPrimitiveAmountValue:@(value_)];
}

@dynamic category;

@end

@implementation SMAmountAttributes 
+ (NSString *)amountTitle {
	return @"amountTitle";
}
+ (NSString *)amountValue {
	return @"amountValue";
}
@end

@implementation SMAmountRelationships 
+ (NSString *)category {
	return @"category";
}
@end

