//
//  Entry.m
//  DayX
//
//  Created by Devin Eror on 1/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Entry.h"

@implementation Entry

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = dictionary[TitleKey];
        self.content = dictionary[TextKey];
        self.timestamp = dictionary[timeStampKey];
    }
    return self;
}

- (NSDictionary *)entryDictionary {
    
    NSMutableDictionary *entryDictionary = [NSMutableDictionary new];
    if (self.title) {
        [entryDictionary setObject:self.title forKey:TitleKey];
    }
    if (self.content) {
        [entryDictionary setObject:self.content forKey:TextKey];
    }
    if (self.timestamp) {
        [entryDictionary setObject:self.timestamp forKey:timeStampKey];
    }
    return entryDictionary;
}

@end
