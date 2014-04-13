//
//  SetUpViewController.m
//  Sloth
//
//  Created by Kartik Chillakanti on 4/12/14.
//  Copyright (c) 2014 SKAD. All rights reserved.
//

#import "SetUpViewController.h"
#import "UserDetailsViewController.h"
#import "SectionModel.h"
#import <Parse/Parse.h>


@interface SetUpViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UILabel *stepperLabel;
@property (weak, nonatomic) IBOutlet UIButton *punishmentButton;
@property (weak, nonatomic) IBOutlet UITableView *scheduleTable;

@property (strong, nonatomic) NSArray *punishmentsArray;
@property (weak, nonatomic) IBOutlet UIView *textView;
@property (weak, nonatomic) IBOutlet UIView *pictureView;

@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UITextField *messageTF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (strong, nonatomic) PFObject* userInfo;
@property (strong, nonatomic) NSString* punishmentSelected;

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
//    NSLog(@"row %lu selected", (unsigned long)row);
    [self.punishmentButton setTitle:[self.punishmentsArray objectAtIndex:row] forState:UIControlStateNormal];
    if ([[self.punishmentsArray objectAtIndex:row]  isEqual: @"Text Message"] ) {
        [self.textView setHidden:NO];
        self.punishmentSelected = @"Text Message";
    }
    
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
    
    if ([self.punishmentSelected isEqual: @"Text Message"] ) {
        self.userInfo = [PFObject objectWithClassName:@"UserInfo"];
        self.userInfo[@"Name"] = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
        self.userInfo[@"Punishment"] = @"Text Message";
        self.userInfo[@"punishmentReceiver"] = self.phoneTF.text;
        self.userInfo[@"punishmnetObject"] = self.messageTF.text;
        [self.userInfo saveInBackground];
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


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[SectionModel getSections] count];
}


/*- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ScheduleCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [[[SectionModel getSections ] objectAtIndex:[indexPath row]] sectionName];
    
    return cell;
}*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"ScheduleCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [[[SectionModel getSections ] objectAtIndex:[indexPath row]] sectionName];
    return cell;
}

- (void) importTheDataFromTheServer
{
  //pull the data into a string
  //grab an int as well of the people
  int maxIndex = 2;
  NSString * stringToTest = @"Section1|09:00|12:00|51.509980|-0.133700|00000|Section2|12|13|25.000000|35.000000|00000";
  NSArray* tokenizedArray = [stringToTest componentsSeparatedByString: @"|"];
  for (int i = 0; i < maxIndex; i++) {
    NSString * name = [tokenizedArray objectAtIndex:(i*5 + 0)];
    NSString * start = [tokenizedArray objectAtIndex:(i*5 + 1)];
    NSString * end = [tokenizedArray objectAtIndex:(i*5 + 2)];
    NSNumber * x = [tokenizedArray objectAtIndex:(i*5 + 3)];
    double xloc = [x doubleValue];
    NSNumber * y = [tokenizedArray objectAtIndex:(i*5 + 4)];
    double yloc = [y doubleValue];
    NSString * dys = [tokenizedArray objectAtIndex:(i*5 + 5)];
    [[SectionModel alloc]initWithSectionName:name andStartTime:start andxLoc:xloc andyLoc:yloc andEndTime:end andDays:dys];
  }
  
}

/*- (IBAction)takeSelfieTouched:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = (id)self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}


- (IBAction)chooseSelfieTouched:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = (id)self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    //UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    //self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}*/



@end
