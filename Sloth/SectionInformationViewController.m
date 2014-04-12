//
//  SectionInformationViewController.m
//  Sloth
//
//  Created by Samir Lavingia on 12/04/2014.
//  Copyright (c) 2014 SKAD. All rights reserved.
//

#import "SectionInformationViewController.h"
#import "SectionModel.h"
#import "SectionsTable.h"

@interface SectionInformationViewController ()
@property (strong, nonatomic) IBOutlet UILabel *NameLabel;

@end

@implementation SectionInformationViewController


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
    self.NameLabel.text = [[[SectionModel getSections] objectAtIndex:[SectionsTable rowThatWasPicked]] sectionName];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
