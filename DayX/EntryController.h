//
//  EntryController.h
//  DayX
//
//  Created by Devin Eror on 1/17/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model/Entry.h"

@interface EntryController : NSObject

@property (nonatomic, strong, readonly) NSArray *entries;

+ (EntryController *)sharedInstance;

- (void)addEntries:(Entry *)entry;
- (void)removeEntry:(Entry *)entry;
- (void)replaceEntry:(Entry *)oldEntry withEntry:(Entry *)newEntry;

@end
