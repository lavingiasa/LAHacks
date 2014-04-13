//
//  InputViewController.m
//  Sloth
//
//  Created by Kartik Chillakanti on 4/12/14.
//  Copyright (c) 2014 SKAD. All rights reserved.
//

#import "InputViewController.h"
#import "MyLocationViewController.h"
#import "SectionModel.h"

@interface InputViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *startTF;
@property (weak, nonatomic) IBOutlet UITextField *endTF;

@property (strong, nonatomic) IBOutlet UIButton *mondayButton;

@property (strong, nonatomic) IBOutlet UIButton *tuesdayButton;

@property (strong, nonatomic) IBOutlet UIButton *wednesdayButton;

@property (strong, nonatomic) IBOutlet UIButton *thursdayButton;

@property (strong, nonatomic) IBOutlet UIButton *fridayButton;

@property (weak, nonatomic) IBOutlet UIButton *saveButton;


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
    _startTF.delegate = self;
    _endTF.delegate = self;
  
}

- (IBAction)MondayButton:(id)sender
{
    [self.nameTF resignFirstResponder];
    [self.startTF resignFirstResponder];
    [self.endTF resignFirstResponder];
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
    [self.nameTF resignFirstResponder];
    [self.startTF resignFirstResponder];
    [self.endTF resignFirstResponder];
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
    [self.nameTF resignFirstResponder];
    [self.startTF resignFirstResponder];
    [self.endTF resignFirstResponder];
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
    [self.nameTF resignFirstResponder];
    [self.startTF resignFirstResponder];
    [self.endTF resignFirstResponder];
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
    [self.nameTF resignFirstResponder];
    [self.startTF resignFirstResponder];
    [self.endTF resignFirstResponder];
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
    
   
    
    if ((_nameTF.text.length > 0) && (_startTF.text.length > 2) && (_endTF.text.length > 2) && ((mondayBoxSelected) || (tuesdayBoxSelected) || (wednesdayBoxSelected) || (thursdayBoxSelected) || (fridayBoxSelected)) && ([MyLocationViewController coordinateOfAnnotation].latitude != 0) && ([MyLocationViewController coordinateOfAnnotation].longitude != 0)) {
        
        NSString *startTime = @"";
        NSString *endTime = @"";
        if (_startTF.text.length == 3) {
           startTime = [NSString stringWithFormat:@"%@%@", @"0", _startTF.text];
        }
        else {
            startTime = _startTF.text;
        }
        if (_endTF.text.length == 3) {
           endTime = [NSString stringWithFormat:@"%@%@", @"0", _endTF.text];
        }
        else {
            endTime = _endTF.text;
        }
        
        NSString *className = _nameTF.text;
        
        NSString *days = @"";
        
        for (int i = 0; i < 6; i++) {
            if ((i == 0) && (mondayBoxSelected)) {
                days = [NSString stringWithFormat:@"%@%@", days, @"1"];
            }
            else {
                days = [NSString stringWithFormat:@"%@%@", days, @"0"];
            }
            if ((i == 2) && (tuesdayBoxSelected)) {
                days = [NSString stringWithFormat:@"%@%@", days, @"1"];
            }
            else {
                days = [NSString stringWithFormat:@"%@%@", days, @"0"];
            }
            if ((i == 3) && (wednesdayBoxSelected)) {
                days = [NSString stringWithFormat:@"%@%@", days, @"1"];
            }
            else {
                days = [NSString stringWithFormat:@"%@%@", days, @"0"];
            }
            if ((i == 4) && (thursdayBoxSelected)) {
                days = [NSString stringWithFormat:@"%@%@", days, @"1"];
            }
            else {
                days = [NSString stringWithFormat:@"%@%@", days, @"0"];
            }
            if ((i == 5) && (fridayBoxSelected)) {
                days = [NSString stringWithFormat:@"%@%@", days, @"1"];
            }
            else {
                days = [NSString stringWithFormat:@"%@%@", days, @"0"];
            }
        }
       
        [[SectionModel alloc] initWithSectionName:className andStartTime:startTime andxLoc: [MyLocationViewController coordinateOfAnnotation].latitude andyLoc:[MyLocationViewController coordinateOfAnnotation].longitude andEndTime:endTime andDays:days];
        
        NSMutableArray * sections = [SectionModel getSections];
        NSLog(@"%d", sections.count);
        
        
        
        
        
    }
    else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Incomplete!"
                                                        message:@"Please fill all the fields"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];

        
    }
    
    
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    return (newLength > 4) ? NO : YES;
}


- (IBAction)backgroundTouched:(id)sender {
    [self.nameTF resignFirstResponder];
    [self.startTF resignFirstResponder];
    [self.endTF resignFirstResponder];
}

- (IBAction)textfieldExit:(id)sender {
    [sender resignFirstResponder];
}




@end
