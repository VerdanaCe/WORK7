//
//  Contact+CoreDataProperties.h
//  WORK6
//
//  Created by Admin on 12.05.16.
//  Copyright © 2016 SanSetSin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Contact.h"

NS_ASSUME_NONNULL_BEGIN

@interface Contact (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *lastName;
@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSString *phone;
@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) Call *owner;

@end

NS_ASSUME_NONNULL_END
