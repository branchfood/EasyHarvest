//
//  MapOfferingAnnotationView.m
//  TheCollective
//
//  Created by James Graham on 7/14/14.
//  Copyright (c) 2014 FindandForm. All rights reserved.
//

#import "MapOfferingAnnotationView.h"
#import "MapOfferingAnnotation.h"

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
        self.bounds = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, 15, 15);
        UIView *smallCircle = [[UIView alloc] initWithFrame:self.bounds];
        smallCircle.layer.cornerRadius = smallCircle.bounds.size.width/2.0f;
        smallCircle.layer.masksToBounds = YES;
        smallCircle.backgroundColor = [UIColor blueColor];
        smallCircle.alpha = 0.5f;
        [self addSubview:smallCircle];
    }
    return self;
}

@end
