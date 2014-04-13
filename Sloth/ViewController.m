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

@synthesize classesHitToday;
@synthesize moneyWasted;
@synthesize graceDays;
@synthesize cancelDays;
@synthesize classesMissedThisSemester;
@synthesize numberOfClassesPerDay;

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
  
    NSDate *currentDateTime = [NSDate date];
        
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    
    [dateFormatter setDateFormat:@"hh:mm"];
    
    // Get the date time in NSString
    int indexOfTheMatchingSection = -1;
    NSString *dateInStringFormated = [dateFormatter stringFromDate:currentDateTime];
    
    NSString *hoursString = [dateInStringFormated substringWithRange:NSMakeRange(0, 2)];
    int hours = [hoursString intValue];
  
    NSString *minutesString = [dateInStringFormated substringWithRange:NSMakeRange(3, 2)];
    int minutes = [minutesString intValue];
  
    int currentTimeInMinutes = hours * 60 + minutes;
  
    //NSLog(minutesString);
    for (int i = 0; i < [[SectionModel getSections] count]; i++)
    {
      NSString *hoursStartStringOfCurrentThing = [[[[SectionModel getSections] objectAtIndex:i] startTime] substringWithRange:NSMakeRange(0, 2)];
      int hoursStart = [hoursStartStringOfCurrentThing intValue];
      
      NSString *minutesStartOfCurrentThing = [[[[SectionModel getSections] objectAtIndex:i] startTime] substringWithRange:NSMakeRange(3, 2)];
      int minutesStart = [minutesStartOfCurrentThing intValue];
      
      NSString *hoursEndStringOfCurrentThing = [[[[SectionModel getSections] objectAtIndex:i] endTime] substringWithRange:NSMakeRange(0, 2)];
      int hoursEnd = [hoursEndStringOfCurrentThing intValue];
      
      NSString *minutesEndOfCurrentThing = [[[[SectionModel getSections] objectAtIndex:i] endTime] substringWithRange:NSMakeRange(3, 2)];
      int minutesEnd = [minutesEndOfCurrentThing intValue];
      
      int currentSectionsStartTime = hoursStart*60 + minutesStart;
      int currentSectionsEndTime = hoursEnd*60 + minutesEnd;
      
      if(currentTimeInMinutes >= currentSectionsStartTime && currentTimeInMinutes <= currentSectionsEndTime)
      {
        indexOfTheMatchingSection = i;
        break;
      }

    }
    if(indexOfTheMatchingSection == -1)
    {
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wrong Time"
                                                      message:@"There is no class at this time"
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
      [alert show];
      return;
    }
  
    SectionModel *currentSection = [[SectionModel getSections] objectAtIndex:indexOfTheMatchingSection];
                                    
    if(abs(newLocation.coordinate.latitude - [currentSection xLocation]) < .1 && abs(newLocation.coordinate.longitude - [currentSection yLocation]) < .1 )
    {
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Checking In"
                                                      message:@"You checked in!"
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
      [alert show];
      return;
    }else{
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wrong Location"
                                                      message:@"You are too far to check in!"
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
      [alert show];
      return;
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
  [[SectionModel alloc] initWithSectionName:@"Section1" andStartTime:@"09:00" andxLoc: 51.50998 andyLoc:-0.133700 andEndTime:@"12:00" andDays: @"00001"];
  [[SectionModel alloc] initWithSectionName:@"Section2" andStartTime:@"12" andxLoc: 25 andyLoc:35 andEndTime:@"13" andDays:@"10101"];
  NSMutableArray * sections = [SectionModel getSections];
  
  for(int i = 0; i < [sections count]; i++)
  {
    NSLog(@"asdf");
  }
  
}

@end
