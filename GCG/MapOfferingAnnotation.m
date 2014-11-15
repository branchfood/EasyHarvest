//
//  MapOfferingAnnotation.m
//  TheCollective
//
//  Created by James Graham on 7/14/14.
//  Copyright (c) 2014 FindandForm. All rights reserved.
//

#import "MapOfferingAnnotation.h"
#import "Location.h"

@implementation MapOfferingAnnotation
@synthesize coordinate;

- (instancetype)initWithLocation:(Location *)location
{
    if (self = [super init])
    {
        self.location = location;
        CGFloat latitude = [self.location.latitude floatValue];
        CGFloat longitude = [self.location.longitude floatValue];
        coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    }
    return self;
}

@end
