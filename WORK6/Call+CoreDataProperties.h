//
//  Call+CoreDataProperties.h
//  WORK6
//
//  Created by Admin on 12.05.16.
//  Copyright © 2016 SanSetSin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Call.h"

NS_ASSUME_NONNULL_BEGIN

@interface Call (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *note;
@property (nullable, nonatomic, retain) NSDate *timeStamp;
@property (nullable, nonatomic, retain) NSManagedObject *calls;

@end

NS_ASSUME_NONNULL_END
