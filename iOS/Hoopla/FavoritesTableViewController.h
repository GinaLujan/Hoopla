//
//  FavoritesTableViewController.h
//  Hoopla
//
//  Created by Chris Bruce on 12/4/11.
//  Copyright (c) 2011 Diversion, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoritesTableViewController : UITableViewController
@property (nonatomic, strong) NSMutableArray *results;
@property (nonatomic, strong) NSMutableArray *sections;

- (void)fetchedData:(NSData *)responseData;
@end
