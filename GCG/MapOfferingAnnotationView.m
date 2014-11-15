//
//  MapOfferingAnnotationView.m
//  TheCollective
//
//  Created by James Graham on 7/14/14.
//  Copyright (c) 2014 FindandForm. All rights reserved.
//

#import "MapOfferingAnnotationView.h"
#import "MapOfferingAnnotation.h"
@interface MapOfferingAnnotationView()
@property (nonatomic, strong) UIButton *leftCalloutButton;
@property (strong, nonatomic) UIView *smallCircle;
@end

@implementation MapOfferingAnnotationView

+ (UIImage *)annotationImage
{
    return [UIImage imageNamed:@"offering-annotation"];
}

- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super init])
    {
        self.bounds = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, 30, 30);
        _smallCircle = [[UIView alloc] initWithFrame:self.bounds];
        _smallCircle.layer.cornerRadius = (_smallCircle.bounds.size.width)/2.0f;
        _smallCircle.layer.masksToBounds = YES;
        _smallCircle.alpha = 0.4f;
        [self addSubview:_smallCircle];
        _smallCircle.layer.shadowColor = [UIColor blackColor].CGColor;
        _smallCircle.layer.shadowOffset = CGSizeMake(2, 2);
        _smallCircle.layer.borderWidth = 2;
        _smallCircle.layer.borderColor = [UIColor brownColor].CGColor;
        
        _leftCalloutButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [_leftCalloutButton addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        self.leftCalloutAccessoryView = _leftCalloutButton;
        
        _smallCircle.layer.shadowOpacity = 1.0f;
        _smallCircle.layer.shadowRadius = 2.0f;
    }
    return self;
}





- (void)touchUpInside:(UIButton *)sender{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    CGRect newFrame = tableView.frame;
    newFrame.size = CGSizeMake(200, 400);
    newFrame.origin.x = newFrame.origin.x - newFrame.size.width;
    tableView.frame = newFrame;
    [self.leftCalloutAccessoryView addSubview:tableView];
}

- (void)setCircleColor:(UIColor *)color{
    self.smallCircle.backgroundColor = color;
}

@end
