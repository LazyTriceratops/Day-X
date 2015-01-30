//
//  EntryController.m
//  DayX
//
//  Created by Devin Eror on 1/17/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "EntryController.h"

static NSString * const entryListKey = @"entryList";

@interface EntryController ()

@property (nonatomic, strong) NSArray *entries;

@end

@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EntryController alloc] init];
        
        [sharedInstance loadFromDefaults];
    });
    return sharedInstance;
}

- (void)addEntries:(Entry *)entry {
    if (!entry) {
        return;
    }
    NSMutableArray *mutableEntries = [[NSMutableArray alloc] initWithArray:self.entries];
    [mutableEntries addObject:entry];
    
    self.entries = mutableEntries;
    [self synchronize];
}

- (void)removeEntry:(Entry *)entry {
    if (!entry) {
        return;
    }
    NSMutableArray *mutableEntries = [[NSMutableArray alloc] initWithArray:self.entries];
    [mutableEntries removeObject:entry];
    
    self.entries = mutableEntries;
    [self synchronize];
}

- (void)replaceEntry:(Entry *)oldEntry withEntry:(Entry *)newEntry {
    if (!oldEntry || !newEntry) {
        return;
    }
    NSMutableArray *mutableEntries = self.entries.mutableCopy;
    
    if ([mutableEntries containsObject:oldEntry]) {
        NSInteger index = [mutableEntries indexOfObject:oldEntry];
        [mutableEntries replaceObjectAtIndex:index withObject:newEntry];
    }
    self.entries = mutableEntries;
    [self synchronize];
}

- (void) loadFromDefaults {
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:entryListKey];
    NSMutableArray *entries = [NSMutableArray new];
    for (NSDictionary *entry in entryDictionaries) {
        [entries addObject:[[Entry alloc] initWithDictionary:entry]];
    }
    self.entries = entries;
}

- (void)synchronize {
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    for (Entry *entry in self.entries) {
        [entryDictionaries addObject:[entry entryDictionary]];
    }
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:entryListKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
