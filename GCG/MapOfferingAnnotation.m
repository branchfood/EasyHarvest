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
    return [self initWith2DCoordinate:coordinate2d andTitle:titleString andFarmType:FarmTypeOther];
}
- (instancetype)initWith2DCoordinate:(CLLocationCoordinate2D)coordinate2d andTitle:(NSString *)titleString andFarmType:(FarmType)farmType{
    if (self = [super init]) {
        _title = titleString;
        coordinate = coordinate2d;
        self.backgroundColor = [self colorForFarmType:farmType];
    }
    return self;
}

- (instancetype)initWith2DCoordinate:(CLLocationCoordinate2D)coordinate2d andTitle:(NSString *)titleString andFarmType:(FarmType)farmType andTotalYield:(CGFloat)yield{
    if (self = [super init]) {
        _title = titleString;
        coordinate = coordinate2d;
        self.backgroundColor = [self colorForFarmType:farmType];
        _subtitle = [NSString stringWithFormat:@"Yield: %.2flbs", yield];
    }
    return self;
}

- (instancetype)initWith2DCoordinate:(CLLocationCoordinate2D)coordinate2d andTitle:(NSString *)titleString andFarmType:(FarmType)farmType andTotalYield:(CGFloat)yield andSquareFootage:(int)squareFeet{
    if (self = [super init]) {
        _title = titleString;
        coordinate = coordinate2d;
        self.backgroundColor = [self colorForFarmType:farmType];
        _subtitle = [NSString stringWithFormat:@"%d ft²  |  %.2flbs", squareFeet, yield];
    }
    return self;
}

- (UIColor *)colorForFarmType:(FarmType)farmType{
    switch (farmType) {
        case FarmTypeBasic:
            return [UIColor greenColor];
            break;
        case FarmTypeCorporateEducational:
            return [UIColor yellowColor];
            break;
        case FarmTypeOther:
            return [UIColor purpleColor];
            break;
            
        default:
            return [UIColor blackColor];
            break;
    }
}

@end
