//
//  MyLocationViewController.h
//  Sloth
//
//  Created by Samir Lavingia on 12/04/2014.
//  Copyright (c) 2014 SKAD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface MyLocationViewController : UIViewController <MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
+(CLLocationCoordinate2D) coordinateOfAnnotation;

@end
