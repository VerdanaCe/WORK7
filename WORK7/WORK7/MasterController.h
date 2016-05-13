/*
//  MasterController.h
//  WORK7
//
//  Created by Admin on 13.05.16.
//  Copyright © 2016 SanSetSin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface MasterController : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) NSFetchedResultsController *callFetchedResultsController;
@property (strong, nonatomic) NSFetchedResultsController *contactFetchedResultsController;

//@property (nonatomic) NSString * searchString;

+ (instancetype)sharedInstance;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
-(void)refresh;

@end
*/