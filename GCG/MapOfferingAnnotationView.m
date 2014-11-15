//
//  MapOfferingAnnotationView.m
//  TheCollective
//
//  Created by James Graham on 7/14/14.
//  Copyright (c) 2014 FindandForm. All rights reserved.
//

#import "MapOfferingAnnotationView.h"
#import "MapOfferingAnnotation.h"
#import "Location.h"
#import "UIColor+TKCategory.h"

@implementation MapOfferingAnnotationView

+ (UIImage *)annotationImage
{
    return [UIImage imageNamed:@"offering-annotation"];
}

- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UIImageView *image = [[UIImageView alloc] initWithImage:[[self class] annotationImage]];
        self.frame = image.frame;
        self.center = image.center;
        [self addSubview:image];
    }
    return self;
}

@end
