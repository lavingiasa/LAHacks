//
//  ViewController.m
//  Sloth
//
//  Created by Samir Lavingia on 12/04/2014.
//  Copyright (c) 2014 SKAD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)checkIn:(id)sender
{
  NSLog(@"You are checking in now!");
  locationManager.delegate = self;
  locationManager.desiredAccuracy = kCLLocationAccuracyBest;
  
  [locationManager startUpdatingLocation];

  //get current location
  //check if you are in the right place
  //if you are in the right place then nothing, if you are not then print error
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    NSLog(@"OldLocation %f %f", oldLocation.coordinate.latitude, oldLocation.coordinate.longitude);
    NSLog(@"NewLocation %f %f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
    [locationManager stopUpdatingLocation];

}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
  NSLog(@"didFailWithError: %@", error);
  UIAlertView *errorAlert = [[UIAlertView alloc]
                             initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
  [errorAlert show];
}

- (IBAction)cancelClass:(id)sender
{
  NSLog(@"You are canceling now!");
}

@end
