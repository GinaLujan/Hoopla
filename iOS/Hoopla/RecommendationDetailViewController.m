//
//  RecommendationDetailViewController.m
//  Hoopla
//
//  Created by Chris Bruce on 12/4/11.
//  Copyright (c) 2011 Diversion, Inc. All rights reserved.
//

#import "RecommendationDetailViewController.h"
#import "AppDelegate.h"

#import <QuartzCore/QuartzCore.h>

@implementation RecommendationDetailViewController
@synthesize recommendation = _recommendation;
@synthesize titleLabel = _titleLabel;
@synthesize subtitleLabel = _subtitleLabel;
@synthesize mapView = _mapView;
@synthesize pointAnnotation = _pointAnnotation;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mapView.layer.cornerRadius = 15;
    
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.recommendation) {
        self.titleLabel.text = _recommendation.title;
        self.subtitleLabel.text = _recommendation.subtitle;
        
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        MKCoordinateRegion newRegion;
        newRegion.center = appDelegate.currentLocation;
        newRegion.span.latitudeDelta = 0.002; 
        newRegion.span.longitudeDelta = 0.002;
        self.mapView.region = newRegion;
        [self.mapView setCenterCoordinate:_recommendation.location.coordinate];
        [self.mapView addAnnotation:_recommendation];
        
    }
    
}

- (void)viewDidUnload
{
    [self setTitleLabel:nil];
    [self setSubtitleLabel:nil];
    [self setMapView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    static NSString *identifier = @"Recommendation";   
    if ([annotation isKindOfClass:[Recommendation class]]) {
        //Recommendation *recommendation = (Recommendation *) annotation;
        
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [_mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else {
            annotationView.annotation = annotation;
        }
        
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        
        UIButton *detailDisclosure = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [detailDisclosure addTarget:self action:@selector(directions:) forControlEvents:UIControlEventTouchUpInside];
        annotationView.rightCalloutAccessoryView = detailDisclosure;
        [mapView selectAnnotation:annotation animated:YES];

        return annotationView;
    }
    
    return nil;    
}

- (IBAction)directions:(id)sender {
    NSString *routeString = [NSString stringWithFormat:@"http://maps.google.com/maps?q=%g,%g", _recommendation.coordinate.latitude, _recommendation.coordinate.longitude];
    NSLog(@"Google URL: %@", routeString);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:routeString]];
}

@end
