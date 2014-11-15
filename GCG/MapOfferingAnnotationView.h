//
//  MapOfferingAnnotationView.h
//  TheCollective
//
//  Created by James Graham on 7/14/14.
//  Copyright (c) 2014 FindandForm. All rights reserved.
//

#import <MapKit/MKAnnotationView.h>

#define TC_MAP_ANNOTATION_VIEW_IDENTIFIER @"TCMapAnnotationViewIdentifier"

@interface MapOfferingAnnotationView : MKAnnotationView

+ (UIImage *)annotationImage;

@end
