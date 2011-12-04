//
//  Recommendation.h
//  Hoopla
//
//  Created by Chris Bruce on 12/3/11.
//  Copyright (c) 2011 Diversion, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recommendation : NSObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *zip;
@property (nonatomic, strong) NSDate  *startsAt;

+ (NSArray *)recommendationsFromArray:(NSArray *)array;

+ (id)recommendationFromDict:(NSDictionary *)dict;

@end
