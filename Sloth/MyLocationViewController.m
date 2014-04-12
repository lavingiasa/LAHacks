//
//  MyLocationViewController.m
//  Sloth
//
//  Created by Samir Lavingia on 12/04/2014.
//  Copyright (c) 2014 SKAD. All rights reserved.
//

#import "MyLocationViewController.h"

@interface MyLocationViewController ()

@end

@implementation MyLocationViewController

@synthesize mapView;
static CLLocationCoordinate2D coordinateOfAnnotation;
bool placeSelected = false;


//- (void)handleLongPressGesture:(UIGestureRecognizer*)sender
//{
//  NSLog(@"bunt");
//  if (sender.state == UIGestureRecognizerStateEnded)
//  {
//    [self.mapView removeGestureRecognizer:sender];
//  }
//  else
//  {
//    // Here we get the CGPoint for the touch and convert it to latitude and longitude coordinates to display on the map
//    CGPoint point = [sender locationInView:self.mapView];
//    CLLocationCoordinate2D locCoord = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
//    // Then all you have to do is create the annotation and add it to the map
//    MKPointAnnotation *dropPin = [[MKPointAnnotation alloc] init];
//    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(locCoord.latitude, locCoord.longitude);
//    dropPin.coordinate = coord;
//    [self.mapView addAnnotation:dropPin];
//    }
//  }

-(void)handleLongPressGesture:(UIGestureRecognizer*)sender {
  
  NSLog(@"bunt");
  if (sender.state == UIGestureRecognizerStateEnded)
  {
    [self.mapView removeGestureRecognizer:sender];
  }
  else
  {
    // Here we get the CGPoint for the touch and convert it to latitude and longitude coordinates to display on the map
    CGPoint point = [sender locationInView:self.mapView];
    CLLocationCoordinate2D locCoord = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
    // Then all you have to do is create the annotation and add it to the map
    MKPointAnnotation *dropPin = [[MKPointAnnotation alloc] init];
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(locCoord.latitude, locCoord.longitude);
    dropPin.coordinate = coord;
    placeSelected = true;
    coordinateOfAnnotation = coord;
    
    [self.mapView addAnnotation:dropPin];
  }

}

- (IBAction)saveTheLocation:(id)sender
{
  if(!placeSelected)
  {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You didn't drop a pin"
                                                    message:@"You didn't drop a pin"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
  }else{
    [self dismissModalViewControllerAnimated:YES];
  }
  
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGesture:)];
    [self.mapView addGestureRecognizer:longPressGesture];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
