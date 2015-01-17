//
//  Entry.h
//  DayX
//
//  Created by Devin Eror on 1/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * content;

- (NSDictionary *)toDictionary;

+ (Entry *)fromDictionary:(NSDictionary *)dictionary;

@end
