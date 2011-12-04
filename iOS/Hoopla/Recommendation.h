//
//  Recommendation.h
//  Hoopla
//
//  Created by Chris Bruce on 12/3/11.
//  Copyright (c) 2011 Diversion, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <Mapkit/Mapkit.h>

@interface Recommendation : NSObject <MKAnnotation>

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *zip;
@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;
@property (readonly) CLLocation *location;
@property (nonatomic, strong) NSDate  *startsAt;
@property (nonatomic, strong) NSNumber *rating;
@property (nonatomic) BOOL isFavorite;


+ (NSArray *)recommendationsFromArray:(NSArray *)array;

+ (id)recommendationFromDict:(NSDictionary *)dict;

@end
