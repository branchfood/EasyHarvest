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

@end

@implementation ViewController{
    NSUInteger geocodeIndex;
}

- (NSArray *)dummyAnnotations{
    if (!_dummyAnnotations) {
        _dummyAnnotations = @[
                              [[MapOfferingAnnotation alloc] initWith2DCoordinate:CLLocationCoordinate2DMake(23, 2) andTitle:@"Little house"],
                              [[MapOfferingAnnotation alloc] initWith2DCoordinate:CLLocationCoordinate2DMake(2, 23) andTitle:@"On the prairie"]
                            ];
    }
    return _dummyAnnotations;
}
- (void)receivedNotificaiton:(NSNotification *)aNotification{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
        [geocoder geocodeAddressString:[self.array[geocodeIndex] firstObject] completionHandler:^(NSArray *placemarks, NSError *error) {
            if (!error) {
                for (CLPlacemark *placemark in placemarks) {
                    NSLog(@"%f, %f", placemark.location.coordinate.latitude, placemark.location.coordinate.longitude);
                }
                geocodeIndex++;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"NAME" object:nil];

                });
            }
            else {
                NSLog(@"ERRROR %@\N%@", [error userInfo], error);
            }
        }];

}
- (void)viewDidLoad {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receivedNotificaiton:) name:@"NAME" object:nil];
    [super viewDidLoad];
    self.mapView.delegate = self;
    
    [self.mapView addAnnotations:self.dummyAnnotations];
    
    
    _array = @[
                       @[@"PO Box 345,Seekonk, MA 02771"],
                       @[@"50 Brastow Ave,Somerville, MA 02143"],
                       @[@"40 Inman St,Cambridge, MA 02139"],
                       @[@"112 Elm St,Byfield, MA 01922"],
                       @[@"213 Webster St Apt #2,East Boston, MA,02128"],
                       @[@"219 Washington St,Wellesley Hills, MA,02481"],
                       @[@"5 Park St,Medford, MA,02155"],
                       @[@"32 Lyle Ter,Malden, MA,02148"],
                       @[@"11 French Dr,Boylston, MA,01505-0598"],
                       @[@"22 Prospect Hill Ave, Apt. 2,Somerville, MA,02143"],
                       @[@"123 Antwerp Street,Brighton, MA,02135"],
                       @[@"78 Arlington Rd,Chestnut Hill, MA,02467"],
                       @[@"4 Addington Rd,Brookline, MA,02445"],
                       @[@"581 East Broadway,Boston, MA,02127"],
                       @[@"7 Spencer St,Lexington, MA,02420"],
                       @[@"150 Valentine St,West Newton, MA,02465"],
                       @[@"Attn: Accounts Payable,Watertown, MA,02472"],
                       @[@"40 Judith Rd,Newton, MA,02459-1716"],
                       @[@"291 3rd St,Cambridge, MA,02142"],
                       @[@"ATTN: Accounts Payable,Cambridge, MA,02138"],
                       @[@"315 Cardinal Medeiros Ave,Cambridge, MA,02141"],
                       @[@"92 Rogers Ave Apt 1,Somerville, MA,02144-2209"],
                       @[@"45 Russell St, Unit 1,Somerville, MA,02144"],
                       @[@"185 Bellevue Road,Watertown, MA,02472"],
                       @[@"400 Arsenal St,Watertown, MA,02472"],
                       @[@"255 Washington Street,Boston, MA,02108"],
                       @[@"84 Summer St,Boston, MA,02110"],
                       @[@"255 Washington Street,Boston, MA,02108"],
                       @[@"24 Dunster St,Cambridge, MA,02138"],
                       @[@"98 Derby St,Hingham, MA,02043"],
                       @[@"168 Great Rd,Bedford, MA,01730"],
                       @[@"655 Boylston Street,Boston, MA,02116"],
                       @[@"219 Daniel Webster Highway,Nashua, NH,03060"],
                       @[@"86 Van Ness Rd,Belmont, MA,02478"],
                       @[@"29 Shermans Way,Westwood, MA,02090"],
                       @[@"15 Old Meadow Rd,Dover, MA,02030"],
                       @[@"791 Hammond St,Chestnut Hill, MA,02467"],
                       @[@"46 Boylston Street,Boston, MA,02130"],
                       @[@"40 Baldwin Rd,Marblehead, MA,01945"],
                       @[@"21 Notre Dame Avenue,Cambridge, MA,02140"],
                       @[@"51 Putnam Road,Somerville, MA,02143"],
                       @[@"78 Avenue Louis Pasteur,Boston, MA,02115"],
                       @[@"4 Cambridge Center,Cambridge, MA,02142"],
                       @[@"70 Union Square,Somerville, MA,02143"],
                       @[@"33 Columbus Ave,Somerville, MA,02143"],
                       @[@"15 Cottage Street,Cambridge, MA,02139"],
                       @[@"Attn: Brian Bunnell,Cambridge, MA,02140"],
                       @[@"c/o The Connors Family Office,Boston, MA,02116"],
                       @[@"20 Jaques St,Somerville, MA,02145"],
                       @[@"95 Irving St,Cambridge, MA,02138"],
                       @[@"18 Boylston st, ,Jamaica Plain, MA,02130"],
                       @[@"93 Highland Ave,Somerville, MA,02143"],
                       @[@"21 Concolor Ave,Newton, MA,02458"],
                       @[@"45 Chester St,Newton, MA,02461"],
                       @[@"814 East Squantum St,North Quincy, MA,02171"],
                       @[@"63 Chilton St,Cambridge, MA,02138"],
                       @[@"97 Weston Rd,Lincoln, MA,01773"],
                       @[@"55 Washburn Ave,Cambridge, MA,02140"],
                       @[@"110 Harvard Ave,Medford, MA,02155"],
                       @[@"930 Winter St,Waltham, MA,02451"],
                       @[@"90 Sandy Valley Road, ,Dedham, MA,02026"],
                       @[@"Environmental Coordinator,Dedham, MA,02026"],
                       @[@"attn: Bookkeeper,Winchester, MA,01890"],
                       @[@"38 Middlesex Street,Qunicy, MA,02171"],
                       @[@",, ,"],
                       @[@"Attn: Accounts Payable Department,Boston, MA,02120"],
                       @[@"76 Cleveland St,East Arlington, MA,02474"],
                       @[@"Attention: Accounts Payable,Dorchester, MA,02124"],
                       @[@",, ,"],
                       @[@"12 Bellis Circle,Cambridge, MA,02140"],
                       @[@"23 Westminster St Unit #3,Somerville, MA,02144"],
                       @[@"157 Country Dr,Weston, MA,02493"],
                       @[@"25 Wedgemere Ave,Winchester, MA,01890"],
                       @[@"67 Maple st,Milton, MA,02186"],
                       @[@"4 High Street,Hampton, NH,03842"],
                       @[@"12 Shannon Lane,Beverly, MA,01915"],
                       @[@"112 Grover Road Extension,Medford, MA,02155"],
                       @[@"39 Church St,Boston, MA,02116"],
                       @[@"ATTN: Accounts Payable,Cambridge, MA,02140"],
                       @[@"297 Buckminster Rd,Brookline, MA,02445"],
                       @[@"3 Crooked Meadow Lane,Hingham, MA,02043"],
                       @[@"21 Lorraine St,Roslindale, MA,02131"],
                       @[@"172 Bellevue Rd,Watertown, MA,02472"],
                       @[@"14 Hawthorne St,Brookline, MA,02445"],
                       @[@"Attn: Accounts Payable,Brookline, MA,02445"],
                       @[@"5 Ash Lane,Medway, MA,02053"],
                       @[@"7 Conrad Circle,Wenham, MA,01984"],
                       @[@"19 Brook St,Brookline, MA,02445"],
                       @[@"26 Edgewater Dr,Dover, MA,02030"],
                       @[@"291 Musterfield Rd,Concord, MA,01742"],
                       @[@"25 Marion Street,Hingham, MA,02043"],
                       @[@"Attn: Accounts Payable,Wellesley, MA,02481"],
                       @[@"12 Neponset Court,Roslindale, MA,02131"],
                       @[@"222 Brattle St,Cambridge, MA,02138"],
                       @[@"234 Causeway St, Apt 1006,Boston, MA,02114"],
                       @[@",, ,"],
                       @[@"75 Union Square,Somerville, MA,02143"],
                       @[@",, ,"],
                       @[@"63 Philbrick Street #2,Roslindale, MA,02131"],
                       @[@",, ,"],
                       @[@"12 Lakeview Ave,Cambridge, MA,02138"],
                       @[@"55 Norwell Rd,Dedham, MA,02026"],
                       @[@"24 Lake st,Somerville, MA,02143"],
                       @[@"288 Homer st,Newton, MA,02459"],
                       @[@"104 Rawson Rd,Brookline, MA,02445"],
                       @[@"42 Birch St,Needham, MA,02494"],
                       @[@"185 Valentine St,Newton, MA,"],
                       @[@",, ,"],
                       @[@"111 Temple st,West Newton, MA,02465"],
                       @[@"265 Otis St,Newton, MA,02465"],
                       @[@"46 Dudley Rd,Brookline, MA,02445"],
                       @[@"130 Essex St,Brookline, MA,02446"],
                       @[@"3 Bushnell Dr,Lexington, MA,02421"],
                       @[@"901 Stearns Hill Rd,Waltham, MA,02451"],
                       @[@"88 Elm St,Milton, MA,02186"],
                       @[@"Brandeis University,Waltham, MA,02453"],
                       @[@"40 Howells Rd,Belmont, MA,02478"],
                       @[@"Attn: Accounts Payable,Brookline, MA,02445"],
                       @[@"1 Lynch Circle,Woburn, MA,01801"],
                       @[@"224 Albany St,Cambridge, MA,02139"],
                       @[@"39 Pine St,Weston, MA,02493"],
                       @[@"ATTN: Accounts Payable,Webster, MA,01570"],
                       @[@"20 Oak St,Cambridge, MA,02139"],
                       @[@"79 W Concord St,Boston, MA,02118"],
                       @[@"860 Winter St,Waltham, MA,02451-1411"],
                       @[@"109 Summer Street,Somerville, MA,02143"],
                       @[@"138 Main St,Andover, MA,01810"],
                       @[@"662 Massachusetts Ave, Apt 6,Boston, MA,02118"],
                       @[@"39 Magazine St,Cambridge, MA,02139"],
                       @[@"231 Randolph Ave,Milton, MA,02186"],
                       @[@"24 Talcott Pines Road,Plymouth, MA,02360"],
                       @[@"20 Amory St.,Brookline, MA,02446"],
                       @[@"Northern Boulevard,Old Westbury, NY,1156"],
                       @[@"40 Partridge Lane,Concord, MA,01742"],
                       @[@"50A Spring Street,Somerville, MA,02143"],
                       @[@"52 Hood Street,Newton, MA,02458"],
                       @[@"33 Putnam St #2,Somerville, MA,02143"],
                       @[@"7 Birch Wood Drive,Beverly, MA,01915"],
                       @[@"82 Green St,Jamaica Plain, MA,02130"],
                       @[@"75 Emerson Rd,Wellesley, MA,02481"],
                       @[@"9 Olive Sq,Somerville, MA,02143"],
                       @[@"325 Harvard St,Cambridge, MA,02139"],
                       @[@"11 Seaview Ave.,Malden, MA,02148"],
                       @[@"8 Magnolia Lane,Natick, MA,01760"],
                       @[@"9 Brown St,Cambridge, MA,02138"],
                       @[@"108 Inman St,Cambridge, MA,02139"],
                       @[@"276 Harvard St #5,Cambridge, MA,02139"],
                       @[@"ATTN: Accounts Payable,Boston, MA,02210"],
                       @[@"29 Fairmont Ave,Cambridge, MA,02139"],
                       @[@"1257 Blue Hill Ave.,Milton, MA,02186"],
                       @[@"23 Hillside Street,Milton, MA,02186"],
                       @[@"58 Fearing Rd,Hingham, MA,02043"],
                       @[@"135 Washington st.,Malden, MA,02148"],
                       @[@"31 Leslie Rd,Auburndale, MA,02466"],
                       @[@"65 Hammond St,Chestnut Hill, MA,02467"],
                       @[@"134 Sumner St,Newton, MA,02458"],
                       @[@"4 Buttercup Lane,Dover, MA,02030"],
                       @[@"262 Summer Street,Lynnfield, MA,01940"],
                       @[@"11 Robbins Rd,Lexington, MA,02421"],
                       @[@"ATTN: Accounts Payable,Boston, MA,02131"],
                       @[@"70 River Street,Boston, MA,02108"],
                       @[@"41 Chappie St,Boston, MA,02129"],
                       @[@"45 Puddingstone Lane,Newton, MA,02459"],
                       @[@"396 Ocean Ave.,Marblehead, MA,01945"],
                       @[@"ATTN: Accounts Payable,Cambridge, MA,02138"],
                       @[@"93 Village St,Marblehead, MA,01945"],
                       @[@"13 Aberdeen Rd,Wellesley, MA,02482"],
                       @[@"9 Allston Street,Dorchester, MA,02124"],
                       @[@"284 Amory Street,Jamaica Plain, MA,02130"],
                       @[@"Attn: Martha Robb,Cambridge, MA,02139"],
                       @[@"698 Massachusetts Ave.,Cambridge, MA,02139"],
                       @[@"27 Newell Rd, Apt. 2,Brookline, MA,02446"],
                       @[@"55 Station St,  Apt 2B,Brookline, MA,02445"],
                       @[@"100 Market Street,Lynnfield, MA,01940"],
                       @[@"15 Edmund Rd,Arlington, MA,02474"],
                       @[@"4 Curtis St,Winchester, MA,01890"],
                       @[@"321 Linwood Ave,Newtonville, MA,02460"],
                       @[@"54 Wicklow St,Malden, MA,02148"],
                       @[@"130 Warren Street,Brookline, MA,02445"]
                       ];
  
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
