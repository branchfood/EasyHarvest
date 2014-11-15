//
//  MapOfferingAnnotation.h
//  TheCollective
//
//  Created by James Graham on 7/14/14.
//  Copyright (c) 2014 FindandForm. All rights reserved.
//

#import <MapKit/MapKit.h>
@interface MapOfferingAnnotation : NSObject <MKAnnotation> {
    CLLocationCoordinate2D coordinate;
}

- (instancetype)initWith2DCoordinate:(CLLocationCoordinate2D)coordinate2d;

@end
