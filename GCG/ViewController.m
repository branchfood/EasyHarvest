//
//  ViewController.m
//  GCG
//
//  Created by James Graham on 11/15/14.
//  Copyright (c) 2014 GreenCityGrowers. All rights reserved.
//

#import "ViewController.h"
#import "MapOfferingAnnotation.h"
#import "MapOfferingAnnotationView.h"
#import <MapKit/MapKit.h>

@interface ViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) NSArray *dummyAnnotations;

@end

@implementation ViewController

- (NSArray *)dummyAnnotations{
    if (!_dummyAnnotations) {
        _dummyAnnotations = @[
                              [[MapOfferingAnnotation alloc] initWith2DCoordinate:CLLocationCoordinate2DMake(23, 2)],
                              [[MapOfferingAnnotation alloc] initWith2DCoordinate:CLLocationCoordinate2DMake(2, 23)]
                              ];
    }
    return _dummyAnnotations;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView.delegate = self;
    
    [self.mapView addAnnotations:self.dummyAnnotations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        MKAnnotationView *noView = [[MKAnnotationView alloc] init];
        return noView;
    }
    if ([annotation isKindOfClass:[MapOfferingAnnotation class]])
    {
        MapOfferingAnnotationView *view = (MapOfferingAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:TC_MAP_ANNOTATION_VIEW_IDENTIFIER];
        if (!view) {
            view = [[MapOfferingAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:TC_MAP_ANNOTATION_VIEW_IDENTIFIER];
            [view sizeToFit];
        }
        else {
            view.annotation = annotation;
        }
        return view;
    }
    else {
        return nil;
    }
    
}
@end
