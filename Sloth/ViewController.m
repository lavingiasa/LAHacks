//
//  ViewController.m
//  Sloth
//
//  Created by Samir Lavingia on 12/04/2014.
//  Copyright (c) 2014 SKAD. All rights reserved.
//

#import "ViewController.h"
#import "SectionModel.h"

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
  
    NSDate *now = [[NSDate alloc] init];
  
  
    for (int i = 0; i < [[SectionModel getSections] count]; i++)
    {
      
    }

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
  [[SectionModel alloc] initWithSectionName:@"Section1" andStartTime:@"12" andxLoc: 51.50998 andyLoc:-0.133700 andEndTime:@"13" andDays: @"00001"];
  [[SectionModel alloc] initWithSectionName:@"Section2" andStartTime:@"12" andxLoc: 25 andyLoc:35 andEndTime:@"13" andDays:@"10101"];
  NSMutableArray * sections = [SectionModel getSections];
  
  for(int i = 0; i < [sections count]; i++)
  {
    NSLog(@"asdf");
  }
  
}

@end
