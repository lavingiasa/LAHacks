//
//  SettingsViewController.m
//  Sloth
//
//  Created by Samir Lavingia on 12/04/2014.
//  Copyright (c) 2014 SKAD. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (strong, nonatomic) IBOutlet UILabel *DaysTillEndLabel;
@property (strong, nonatomic) IBOutlet UIButton *resetButton;

@end

@implementation SettingsViewController
@synthesize DaysTillEndLabel;
@synthesize resetButton;

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
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *compsD = [gregorian components:NSDayCalendarUnit fromDate:[NSDate date]];
    NSDateComponents *compsM = [gregorian components:NSMonthCalendarUnit fromDate:[NSDate date]];
    int dayOfYear = [compsD day];
    int monthOfYear = [compsM month];
  
    int guessOfDayNumber = monthOfYear * 30 + dayOfYear;
    [DaysTillEndLabel setText:[NSString stringWithFormat:@"%s%d%s","Around: ",guessOfDayNumber, " Days Left"]];
    if((guessOfDayNumber < 266 && guessOfDayNumber > 170) || (guessOfDayNumber > 340) || (guessOfDayNumber < 12))
    {
      [resetButton setEnabled:YES];
    }
  
  // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
