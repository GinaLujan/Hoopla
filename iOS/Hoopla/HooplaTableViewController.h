//
//  HooplaTableViewController.h
//  Hoopla
//
//  Created by Chris Bruce on 12/3/11.
//  Copyright (c) 2011 Diversion, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommendationTableViewCell.h"

@interface HooplaTableViewController : UITableViewController <FavoriteToggledDelegate>

@property (nonatomic, strong) NSMutableArray *results;
@property (nonatomic, strong) NSMutableArray *sections;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *favTapGestureRecognizer;

- (void)fetchedData:(NSData *)responseData;

@end
