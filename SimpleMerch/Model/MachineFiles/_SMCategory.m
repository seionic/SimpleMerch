// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SMCategory.m instead.

#import "_SMCategory.h"

@implementation SMCategoryID
@end

@implementation _SMCategory

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"SMCategory" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"SMCategory";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"SMCategory" inManagedObjectContext:moc_];
}

- (SMCategoryID*)objectID {
	return (SMCategoryID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic categoryImageData;

@dynamic categoryName;

@dynamic categoryType;

@dynamic amounts;

- (NSMutableSet<SMAmount*>*)amountsSet {
	[self willAccessValueForKey:@"amounts"];

	NSMutableSet<SMAmount*> *result = (NSMutableSet<SMAmount*>*)[self mutableSetValueForKey:@"amounts"];

	[self didAccessValueForKey:@"amounts"];
	return result;
}

@end

@implementation SMCategoryAttributes 
+ (NSString *)categoryImageData {
	return @"categoryImageData";
}
+ (NSString *)categoryName {
	return @"categoryName";
}
+ (NSString *)categoryType {
	return @"categoryType";
}
@end

@implementation SMCategoryRelationships 
+ (NSString *)amounts {
	return @"amounts";
}
@end

