//
//  DXListTableViewDataSource.h
//  DayX
//
//  Created by Devin Eror on 1/17/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DXListTableViewDataSource : NSObject <UITableViewDataSource>

- (void)registerTableView:(UITableView *)tableView;

@end
