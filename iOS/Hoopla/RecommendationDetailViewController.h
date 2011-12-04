//
//  RecommendationDetailViewController.h
//  Hoopla
//
//  Created by Chris Bruce on 12/4/11.
//  Copyright (c) 2011 Diversion, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mapkit/Mapkit.h>

@interface RecommendationDetailViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) Recommendation *recommendation;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) MKPointAnnotation *pointAnnotation;

- (IBAction)directions:(id)sender;
@end
