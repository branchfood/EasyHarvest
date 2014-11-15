//
//  MapOfferingAnnotation.h
//  TheCollective
//
//  Created by James Graham on 7/14/14.
//  Copyright (c) 2014 FindandForm. All rights reserved.
//

#import <MapKit/MKAnnotation.h>

@class Location;

@interface MapOfferingAnnotation : NSObject <MKAnnotation> {
    CLLocationCoordinate2D coordinate;
}

@property (strong, nonatomic) Location *location;

- (instancetype)initWithLocation:(Location *)location;

@end
