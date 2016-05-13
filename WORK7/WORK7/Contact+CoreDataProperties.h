//
//  Contact+CoreDataProperties.h
//  WORK7
//
//  Created by Admin on 13.05.16.
//  Copyright © 2016 SanSetSin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Contact.h"

NS_ASSUME_NONNULL_BEGIN

@interface Contact (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSString *lastName;
@property (nullable, nonatomic, retain) NSString *phone;
@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSSet<Call *> *owner;

@end

@interface Contact (CoreDataGeneratedAccessors)

- (void)addOwnerObject:(Call *)value;
- (void)removeOwnerObject:(Call *)value;
- (void)addOwner:(NSSet<Call *> *)values;
- (void)removeOwner:(NSSet<Call *> *)values;

@end

NS_ASSUME_NONNULL_END
