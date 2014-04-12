//
//  SetUpViewController.m
//  Sloth
//
//  Created by Kartik Chillakanti on 4/12/14.
//  Copyright (c) 2014 SKAD. All rights reserved.
//

#import "SetUpViewController.h"

@interface SetUpViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UILabel *stepperLabel;
@property (weak, nonatomic) IBOutlet UIButton *punishmentButton;

@property (strong, nonatomic) NSArray *punishmentsArray;
@property (weak, nonatomic) IBOutlet UIView *textView;

@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UITextField *messageTF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;

@end

@implementation SetUpViewController

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
    self.punishmentsArray = @[@"Text Message", @"Embarrassing Picture", @"Money", @"Random Facebook Post"];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stepperChanged:(id)sender {
    UIStepper *stepper = (UIStepper *) sender;
    int stepperNum = (int)stepper.value;
    NSString *num = [[NSString alloc] initWithFormat:@"%d", stepperNum];
    self.stepperLabel.text = num;
}

- (IBAction)punishmentPressed:(id)sender
{
    UINavigationController *navigationController = (UINavigationController *)[self.storyboard instantiateViewControllerWithIdentifier:@"PunishmentVC"];
    Punishment *tableViewController = (Punishment *)[[navigationController viewControllers] objectAtIndex:0];
    tableViewController.punishments = self.punishmentsArray;
    tableViewController.navigationItem.title = @"Punishments";
    tableViewController.delegate = self;
    [self presentViewController:navigationController animated:YES completion:nil];
    
}

- (void)itemSelectedatRow:(NSInteger)row
{
    NSLog(@"row %lu selected", (unsigned long)row);
    [self.punishmentButton setTitle:[self.punishmentsArray objectAtIndex:row] forState:UIControlStateNormal];
    if ([[self.punishmentsArray objectAtIndex:row]  isEqual: @"Text Message"] )
        [self.textView setHidden:NO];
    else
        [self.textView setHidden:YES];
}


- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    if (self.completionHandler) {
        self.completionHandler(self.messageTF.text);
    }
    
    return YES;
}

-(BOOL) textField: (UITextField *) textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *changedString = [textField.text stringByReplacingCharactersInRange: range withString: string];
    [self validateSaveButtonForText:changedString];
    return YES;
}
-(void) validateSaveButtonForText: (NSString *) text {
    self.saveButton.enabled = ([text length] > 0);
}

- (IBAction)saveButtonTapped:(id)sender {
    if (self.completionHandler) {
        self.completionHandler(self.messageTF.text);
    }
}

- (IBAction)textFieldExit:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)textFieldDidBeginEditing:(UITextField *)sender {
    [self animateTextField: sender up: YES];
}


- (IBAction)textFieldDidEndEditing:(UITextField *)sender {
    [self animateTextField: sender up: NO];
    
}

- (void) animateTextField: (UITextField*) textField up: (BOOL) up {
    
    const int movementDistance = 160;
    const float movementDuration = 0.3f;
    int movement = (up ? -movementDistance : movementDistance);
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    
    [UIView commitAnimations];
}

- (IBAction)backgroundTouched:(id)sender {
    [self.messageTF resignFirstResponder];
    [self.phoneTF resignFirstResponder];
}



@end
