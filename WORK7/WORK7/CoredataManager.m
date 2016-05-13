//
//  CoredataManager.m
//  WORK7
//
//  Created by Admin on 13.05.16.
//  Copyright © 2016 SanSetSin. All rights reserved.
//

#import "CoreDataManager.h"
#define DEBUG 1

@implementation CoreDataManager

#pragma mark - files
NSString *storeFileName = @"WORK7.sqlite";

#pragma mark - paths

- (NSString *)applicationDocumentsDirectory {
    if (DEBUG == 1) {
        NSLog(@"runnung %@ '%@' ",self.class,NSStringFromSelector(_cmd));
    }
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
}

- (NSURL *)applicationStoresDirectory {
    if (DEBUG == 1) {
        NSLog(@"running %@ '%@' ",self.class,NSStringFromSelector(_cmd));
    }
    
    NSURL *storeDirectory = [[NSURL fileURLWithPath:[self applicationDocumentsDirectory]]URLByAppendingPathComponent:@"store"];
    
    NSFileManager *fileManeger = [NSFileManager defaultManager];
    if (![fileManeger fileExistsAtPath:[storeDirectory path]]) {
        NSError *error = nil;
        if ([fileManeger createDirectoryAtURL:storeDirectory
                  withIntermediateDirectories:YES
                                   attributes:nil
                                        error:&error]) {
            if (DEBUG == 1) {
                NSLog(@"successfully created stores directory");
            }
            
        }
        else {
            NSLog(@"failed to create stores error :%@",error);
        }
    }
    return storeDirectory;
}


- (NSURL *)storeURL {
    if (DEBUG == 1) {
        NSLog(@"runnung %@ '%@' ",self.class,NSStringFromSelector(_cmd));
    }
    return [[self applicationStoresDirectory]URLByAppendingPathComponent:storeFileName];
}

#pragma mark - setup
- (id)init {
    if (DEBUG == 1) {
        NSLog(@"runnung %@ '%@' ",self.class,NSStringFromSelector(_cmd));
    }
    if (self = [super init])
    {
        _model = [NSManagedObjectModel mergedModelFromBundles:nil];
        _coordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:_model];
        _context = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_context setPersistentStoreCoordinator:_coordinator];
    }
    return self;
}

- (void)loadStore {
    if (DEBUG == 1) {
        NSLog(@"runnung %@ '%@' ",self.class,NSStringFromSelector(_cmd));
    }
    if (_store) {
        return;
    }
    /*
     NSDictionary *options = @{
     NSMigratePersistentStoresAutomaticallyOption:@YES,
     // CoreData会把低版本的持久存储区迁移到最新版
     NSInferMappingModelAutomaticallyOption:@NO,
     // 自动推断出源模型实体。
     NSSQLitePragmasOption:@{@"journal_mode":@"DELETE"}
     };
     */
    
    NSError *error;
    _store = [_coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[self storeURL] options:nil error:&error];
    if (!_store) {
        NSLog(@"failed to add store error :%@",error);
        abort();
    }
    else {
        if (DEBUG == 1) {
            NSLog(@"successfully add to store %@",_store);
        }
    }
}

- (void)setupCoreData {
    if (DEBUG == 1) {
        NSLog(@"runnung %@ '%@' ",self.class,NSStringFromSelector(_cmd));
    }
    [self loadStore];
}

#pragma mark - saving
- (void)saveContext {
    if (DEBUG == 1) {
        NSLog(@"runnung %@ '%@' ",self.class,NSStringFromSelector(_cmd));
    }
    if ([_context hasChanges]) {
        NSError *error = nil;
        if ([_context save:&error]) {
            NSLog(@"saved to context");
        }
        else {
            NSLog(@"failed to save to context %@ ",error);
        }
    }
    else {
        NSLog(@"skipped ");
    }
    
}




@end