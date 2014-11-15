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
@property (nonatomic, copy) NSString *subtitle;
@property (strong, nonatomic) UIColor *backgroundColor;

- (instancetype)initWith2DCoordinate:(CLLocationCoordinate2D)coordinate2d;
- (instancetype)initWith2DCoordinate:(CLLocationCoordinate2D)coordinate2d andTitle:(NSString *)titleString;
- (instancetype)initWith2DCoordinate:(CLLocationCoordinate2D)coordinate2d andTitle:(NSString *)titleString andFarmType:(FarmType)farmType;
- (instancetype)initWith2DCoordinate:(CLLocationCoordinate2D)coordinate2d andTitle:(NSString *)titleString andFarmType:(FarmType)farmType andTotalYield:(CGFloat)yield;
- (instancetype)initWith2DCoordinate:(CLLocationCoordinate2D)coordinate2d andTitle:(NSString *)titleString andFarmType:(FarmType)farmType andTotalYield:(CGFloat)yield andSquareFootage:(int)squareFeet;
@end
