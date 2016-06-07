// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SMCategory.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class SMAmount;

@interface SMCategoryID : NSManagedObjectID {}
@end

@interface _SMCategory : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) SMCategoryID *objectID;

@property (nonatomic, strong, nullable) NSData* categoryImageData;

@property (nonatomic, strong, nullable) NSString* categoryName;

@property (nonatomic, strong, nullable) NSString* categoryType;

@property (nonatomic, strong, nullable) NSSet<SMAmount*> *amounts;
- (nullable NSMutableSet<SMAmount*>*)amountsSet;

@end

@interface _SMCategory (AmountsCoreDataGeneratedAccessors)
- (void)addAmounts:(NSSet<SMAmount*>*)value_;
- (void)removeAmounts:(NSSet<SMAmount*>*)value_;
- (void)addAmountsObject:(SMAmount*)value_;
- (void)removeAmountsObject:(SMAmount*)value_;

@end

@interface _SMCategory (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitiveCategoryImageData;
- (void)setPrimitiveCategoryImageData:(NSData*)value;

- (NSString*)primitiveCategoryName;
- (void)setPrimitiveCategoryName:(NSString*)value;

- (NSString*)primitiveCategoryType;
- (void)setPrimitiveCategoryType:(NSString*)value;

- (NSMutableSet<SMAmount*>*)primitiveAmounts;
- (void)setPrimitiveAmounts:(NSMutableSet<SMAmount*>*)value;

@end

@interface SMCategoryAttributes: NSObject 
+ (NSString *)categoryImageData;
+ (NSString *)categoryName;
+ (NSString *)categoryType;
@end

@interface SMCategoryRelationships: NSObject
+ (NSString *)amounts;
@end

NS_ASSUME_NONNULL_END
