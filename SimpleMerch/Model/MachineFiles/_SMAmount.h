// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SMAmount.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class SMCategory;

@interface SMAmountID : NSManagedObjectID {}
@end

@interface _SMAmount : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) SMAmountID *objectID;

@property (nonatomic, strong, nullable) NSString* amountTitle;

@property (nonatomic, strong, nullable) NSNumber* amountValue;

@property (atomic) int32_t amountValueValue;
- (int32_t)amountValueValue;
- (void)setAmountValueValue:(int32_t)value_;

@property (nonatomic, strong, nullable) SMCategory *category;

@end

@interface _SMAmount (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveAmountTitle;
- (void)setPrimitiveAmountTitle:(NSString*)value;

- (NSNumber*)primitiveAmountValue;
- (void)setPrimitiveAmountValue:(NSNumber*)value;

- (int32_t)primitiveAmountValueValue;
- (void)setPrimitiveAmountValueValue:(int32_t)value_;

- (SMCategory*)primitiveCategory;
- (void)setPrimitiveCategory:(SMCategory*)value;

@end

@interface SMAmountAttributes: NSObject 
+ (NSString *)amountTitle;
+ (NSString *)amountValue;
@end

@interface SMAmountRelationships: NSObject
+ (NSString *)category;
@end

NS_ASSUME_NONNULL_END
