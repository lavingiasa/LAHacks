//
//  ViewController.h
//  Sloth
//
//  Created by Samir Lavingia on 12/04/2014.
//  Copyright (c) 2014 SKAD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>
{
  CLLocationManager *locationManager;

}


@property (strong, nonatomic) IBOutlet UIButton *checkIn;

@end
