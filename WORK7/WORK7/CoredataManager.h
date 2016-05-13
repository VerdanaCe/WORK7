//
//  CoredataManager.h
//  WORK7
//
//  Created by Admin on 13.05.16.
//  Copyright © 2016 SanSetSin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject

@property (nonatomic, readonly) NSManagedObjectContext *context;
@property (nonatomic, readonly) NSManagedObjectModel *model;
@property (nonatomic, readonly) NSPersistentStoreCoordinator *coordinator;
@property (nonatomic, readonly) NSPersistentStore *store;


- (void)saveContext;
- (void)setupCoreData;

@end