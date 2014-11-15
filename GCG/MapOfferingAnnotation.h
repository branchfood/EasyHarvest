//
//  MapOfferingAnnotation.h
//  TheCollective
//
//  Created by James Graham on 7/14/14.
//  Copyright (c) 2014 FindandForm. All rights reserved.
//

#import <MapKit/MapKit.h>
typedef enum{
    FarmTypeBasic,
    FarmTypeCorporateEducational,
    FarmTypeOther
} FarmType;

@interface MapOfferingAnnotation : NSObject <MKAnnotation> {
    CLLocationCoordinate2D coordinate;
}
@property (nonatomic, copy) NSString *title;
@property (strong, nonatomic) UIColor *backgroundColor;

- (instancetype)initWith2DCoordinate:(CLLocationCoordinate2D)coordinate2d;
- (instancetype)initWith2DCoordinate:(CLLocationCoordinate2D)coordinate2d andTitle:(NSString *)titleString;
- (instancetype)initWith2DCoordinate:(CLLocationCoordinate2D)coordinate2d andTitle:(NSString *)titleString andFarmType:(FarmType)farmType;
@end
