//
//  InputViewController.m
//  Sloth
//
//  Created by Kartik Chillakanti on 4/12/14.
//  Copyright (c) 2014 SKAD. All rights reserved.
//

#import "InputViewController.h"

@interface InputViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;

@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *startTF;
@property (weak, nonatomic) IBOutlet UITextField *endTF;

@property (strong, nonatomic) IBOutlet UIButton *mondayButton;

@property (strong, nonatomic) IBOutlet UIButton *tuesdayButton;

@property (strong, nonatomic) IBOutlet UIButton *wednesdayButton;

@property (strong, nonatomic) IBOutlet UIButton *thursdayButton;

@property (strong, nonatomic) IBOutlet UIButton *fridayButton;


@property (weak, nonatomic) IBOutlet UITextField *daysTF;

@end


@implementation InputViewController

bool mondayBoxSelected = NO;
bool tuesdayBoxSelected = NO;
bool wednesdayBoxSelected = NO;
bool thursdayBoxSelected = NO;
bool fridayBoxSelected = NO;

UIButton *checkbox1;
@synthesize mondayButton;
@synthesize tuesdayButton;
@synthesize wednesdayButton;
@synthesize thursdayButton;
@synthesize fridayButton;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
}

- (IBAction)MondayButton:(id)sender
{
  if(mondayBoxSelected == YES)
  {
    [mondayButton setImage:[UIImage imageNamed:@"unchecked_box.png"] forState:UIControlStateNormal];
    mondayBoxSelected = NO;
  }else{
    [mondayButton setImage:[UIImage imageNamed:@"checked_box.png"] forState:UIControlStateNormal];
    mondayBoxSelected = YES;
  }

}

- (IBAction)TuesdayButton:(id)sender
{
  if(tuesdayBoxSelected == YES)
  {
    [tuesdayButton setImage:[UIImage imageNamed:@"unchecked_box.png"] forState:UIControlStateNormal];
    tuesdayBoxSelected = NO;
  }else{
    [tuesdayButton setImage:[UIImage imageNamed:@"checked_box.png"] forState:UIControlStateNormal];
    tuesdayBoxSelected = YES;
  }
}
- (IBAction)WednesdayButton:(id)sender
{
  if(wednesdayBoxSelected == YES)
  {
    [wednesdayButton setImage:[UIImage imageNamed:@"unchecked_box.png"] forState:UIControlStateNormal];
    wednesdayBoxSelected = NO;
  }else{
    [wednesdayButton setImage:[UIImage imageNamed:@"checked_box.png"] forState:UIControlStateNormal];
    wednesdayBoxSelected = YES;
  }
}
- (IBAction)ThursdayButton:(id)sender
{
  if(thursdayBoxSelected == YES)
  {
    [thursdayButton setImage:[UIImage imageNamed:@"unchecked_box.png"] forState:UIControlStateNormal];
    thursdayBoxSelected = NO;
  }else{
    [thursdayButton setImage:[UIImage imageNamed:@"checked_box.png"] forState:UIControlStateNormal];
    thursdayBoxSelected = YES;
  }
  
}
- (IBAction)FridayButton:(id)sender
{
  if(fridayBoxSelected == YES)
  {
    [fridayButton setImage:[UIImage imageNamed:@"unchecked_box.png"] forState:UIControlStateNormal];
    fridayBoxSelected = NO;
  }else{
    [fridayButton setImage:[UIImage imageNamed:@"checked_box.png"] forState:UIControlStateNormal];
    fridayBoxSelected = YES;
  }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveButtonPressed:(id)sender {
}


@end
