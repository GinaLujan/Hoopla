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
@synthesize description = _description;
@synthesize address = _address;
@synthesize city = _city;
@synthesize state = _state;
@synthesize zip = _zip;
@synthesize startsAt = _startsAt;

+ (NSArray *)recommendationsFromArray:(NSArray *)array {
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:[array count]];
    for (NSDictionary *dict in array) {
        [results addObject:[self recommendationFromDict:dict]];
    }
    return results;
}

+ (id)recommendationFromDict:(NSDictionary *)dict {
    Recommendation *recommendation = [[Recommendation alloc] init];
    recommendation.identifier = [dict valueForKeyPath:@"id"];
    recommendation.category = [dict valueForKeyPath:@"category"];
    recommendation.type = [dict valueForKeyPath:@"type"];
    recommendation.title = [dict valueForKeyPath:@"title"];
    recommendation.description = [dict valueForKeyPath:@"description"];
    recommendation.address = [dict valueForKeyPath:@"address"];
    recommendation.city = [dict valueForKeyPath:@"city"];
    recommendation.state = [dict valueForKeyPath:@"state"];
    recommendation.zip = [dict valueForKeyPath:@"zip"];
#warning This needs to be fixed
    recommendation.startsAt = [NSDate date];
    
    
}
@end
