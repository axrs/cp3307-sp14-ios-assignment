//
// Created by Alexander Scott on 5/06/2014.
// Copyright (c) 2014 ITJCU Mobile Technology. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ASHighScoreDAO : NSObject

@property(readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property(readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property(readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (id)sharedInstance;

- (NSArray *)all;

- (void)createHighScoreFor:(NSString *)user WithScore:(long)score;

- (void)saveContext;

- (NSURL *)applicationDocumentsDirectory;
@end