//
//  FilterViewController.h
//  Hoopla
//
//  Created by Chris Bruce on 12/4/11.
//  Copyright (c) 2011 Diversion, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FilteredResultsDelegate;

@interface FilterViewController : UIViewController {
    UIGestureRecognizer *_tapGestureRecognizer;
}
@property (weak) id <FilteredResultsDelegate>delegate;

- (IBAction)dismiss:(id)sender;

@end

@protocol FilteredResultsDelegate <NSObject>

@optional
- (void)filteredResults:(NSDictionary *)resultsDict;

@end
