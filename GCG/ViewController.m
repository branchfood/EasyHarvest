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
@property (strong, nonatomic) NSArray *array;
@property (strong, nonatomic) NSArray *coordinateArray;

@end


@implementation ViewController{
    NSUInteger geocodeIndex;
}

- (NSArray *)coordinateArray{
    if (!_coordinateArray) {
        _coordinateArray = @[
                             
                             @[@41.840141, @(-71.317698)],
                             
                             @[@42.389335, @(-71.111212)],
                             
                             @[@42.368678, @(-71.103648)],
                             @[
                             @42.744707, @(-70.921801)],
                             @[
                             @42.364848,@( -71.033285)],
                             @[
                             @42.314861, @(-71.272465)],
                             @[
                             @42.414970, @(-71.100649)],
                             @[
                             @42.437846, @(-71.072012)],
                             @[
                             @42.356971, @(-71.730062)],
                             @[
                             @42.381221, @(-71.092119)],
                             @[
                             @42.360933, @(-71.138928)],
                             @[
                             @42.310003, @(-71.171129)],
                             @[
                             @42.336922, @(-71.133828)],
                             @[
                             @42.335319, @(-71.040956)],
                             @[
                             @42.433082, @(-71.207200)],
                             @[
                             @42.340214, @(-71.216854)],
                             ];
    }
    return _coordinateArray;
}

- (NSArray *)dummyAnnotations{
    if (!_dummyAnnotations) {
       /* _dummyAnnotations = @[
                              [[MapOfferingAnnotation alloc] initWith2DCoordinate:CLLocationCoordinate2DMake(23, 2) andTitle:@"Little house" andFarmType:FarmTypeOther],
                              [[MapOfferingAnnotation alloc] initWith2DCoordinate:CLLocationCoordinate2DMake(2, 23) andTitle:@"On the prairie" andFarmType:FarmTypeBasic]
                            ];*/
        
        NSMutableArray *array = [NSMutableArray array];
        for (NSArray *coordinates in self.coordinateArray) {
            FarmType type = arc4random() % 2 == 0 ? FarmTypeBasic : FarmTypeCorporateEducational;
            if (arc4random() % 2 == 0) {
                type = arc4random() % 2 == 0 ? FarmTypeBasic : FarmTypeOther;
            }
            MapOfferingAnnotation *mapOfferingAnnotation = [[MapOfferingAnnotation alloc] initWith2DCoordinate:CLLocationCoordinate2DMake(((NSNumber *)[coordinates firstObject]).doubleValue, ((NSNumber *)[coordinates lastObject]).doubleValue) andTitle:[NSString stringWithFormat:@"Farm #%d", arc4random()] andFarmType:type];
            [array addObject:mapOfferingAnnotation];
        }
        _dummyAnnotations = array;
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
            view.canShowCallout = YES;

            
        }
        else {
            view.annotation = annotation;
        }
 [view setCircleColor: ((MapOfferingAnnotationView *)annotation).backgroundColor];
        return view;
    }
    else {
        return nil;
    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NAME" object:nil];
}
@end
