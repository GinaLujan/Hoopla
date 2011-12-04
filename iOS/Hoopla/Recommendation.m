//
//  Recommendation.m
//  Hoopla
//
//  Created by Chris Bruce on 12/3/11.
//  Copyright (c) 2011 Diversion, Inc. All rights reserved.
//

#import "Recommendation.h"

@implementation Recommendation

@synthesize identifier = _identifier;
@synthesize category = _category;
@synthesize type = _type;
@synthesize title = _title;
@synthesize subtitle = _subtitle;
@synthesize description = _description;
@synthesize address = _address;
@synthesize city = _city;
@synthesize state = _state;
@synthesize zip = _zip;
@synthesize latitude = _latitude;
@synthesize longitude = _longitude;
@synthesize startsAt = _startsAt;
@synthesize rating = _rating;
@synthesize isFavorite = _isFavorite;

+ (NSArray *)recommendationsFromArray:(NSArray *)array {
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:[array count]];
    for (NSDictionary *dict in array) {
        [results addObject:[self recommendationFromDict:dict]];
    }
    
    NSSortDescriptor *categorySorter = 
        [[NSSortDescriptor alloc] initWithKey:@"category"
                                    ascending:YES
                                     selector:@selector(localizedCaseInsensitiveCompare:)];
    
    NSSortDescriptor *titleSorter = 
    [[NSSortDescriptor alloc] initWithKey:@"title"
                                ascending:YES
                                 selector:@selector(localizedCaseInsensitiveCompare:)];
    
    NSArray *descriptors = [NSArray arrayWithObjects:categorySorter, titleSorter, nil];
    return [results sortedArrayUsingDescriptors:descriptors];
    
//    NSLog(@"Ressults: %@", results);
//    return results;
}

+ (id)recommendationFromDict:(NSDictionary *)dict {
    Recommendation *recommendation = [[Recommendation alloc] init];
    recommendation.identifier = [dict valueForKeyPath:@"id"];
    recommendation.category = [dict valueForKeyPath:@"category"];
    recommendation.type = [dict valueForKeyPath:@"type"];
    recommendation.title = [dict valueForKeyPath:@"title"];
    recommendation.subtitle = [dict valueForKeyPath:@"subtitle"];
    recommendation.description = [dict valueForKeyPath:@"description"];
    recommendation.address = [dict valueForKeyPath:@"address"];
    recommendation.city = [dict valueForKeyPath:@"city"];
    recommendation.state = [dict valueForKeyPath:@"state"];
    recommendation.zip = [dict valueForKeyPath:@"zip"];
    recommendation.latitude = [dict valueForKey:@"latitude"];
    recommendation.longitude = [dict valueForKey:@"longitude"];
#warning This needs to be fixed
    recommendation.startsAt = [NSDate date];
    recommendation.rating = [dict valueForKey:@"rating"];
    recommendation.isFavorite = [[dict valueForKeyPath:@"is_favorite"] boolValue];
    
    return recommendation;
}

- (CLLocation *)location {
    return [[CLLocation alloc] initWithLatitude:[self.latitude doubleValue] longitude:[self.longitude doubleValue]];
}

- (CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake([self.latitude doubleValue], [self.longitude doubleValue]);
}

- (NSString *)description {
    return self.title;
}

@end
