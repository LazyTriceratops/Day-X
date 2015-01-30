//
//  Entry.h
//  DayX
//
//  Created by Devin Eror on 1/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const TitleKey = @"title";
static NSString * const TextKey = @"content";
static NSString * const timeStampKey = @"timestamp";

@interface Entry : NSObject

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSDate * timestamp;

- (id)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)entryDictionary;

@end
