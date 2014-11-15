//
//  MapOfferingAnnotation.m
//  TheCollective
//
//  Created by James Graham on 7/14/14.
//  Copyright (c) 2014 FindandForm. All rights reserved.
//

#import "MapOfferingAnnotation.h"
@implementation MapOfferingAnnotation
@synthesize coordinate;

- (instancetype)initWith2DCoordinate:(CLLocationCoordinate2D)coordinate2d{
    if (self = [super init]) {
        coordinate = coordinate2d;
    }
    return self;
}

- (instancetype)initWith2DCoordinate:(CLLocationCoordinate2D)coordinate2d andTitle:(NSString *)titleString{
    if (self = [super init]) {
        _title = titleString;
        coordinate = coordinate2d;
    }
    return self;
}

@end
