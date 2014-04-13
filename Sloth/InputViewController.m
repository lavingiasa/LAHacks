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



@property (weak, nonatomic) IBOutlet UITextField *daysTF;

@end

@implementation InputViewController

UIButton *checkbox1, *checkbox2, *checkbox3, *checkbox4, *checkbox5, *checkbox6, *checkbox7;
BOOL checkBoxSelected;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

/*- (void)viewDidLoad
{
    [super viewDidLoad];
    
    checkbox1 = [[UIButton alloc] initWithFrame:CGRectMake(x,y,20,20);
    checkbox2 = [[UIButton alloc] initWithFrame:CGRectMake(x,y,20,20);
    checkbox3 = [[UIButton alloc] initWithFrame:CGRectMake(x,y,20,20);
    checkbox4 = [[UIButton alloc] initWithFrame:CGRectMake(x,y,20,20);
    checkbox4 = [[UIButton alloc] initWithFrame:CGRectMake(x,y,20,20);
    checkbox4 = [[UIButton alloc] initWithFrame:CGRectMake(x,y,20,20);
    checkbox4 = [[UIButton alloc] initWithFrame:CGRectMake(x,y,20,20);

                 
                // 20x20 is the size of the checckbox that you want
                // create 2 images sizes 20x20 , one empty square and
                // another of the same square with the checkmark in it
                // Create 2 UIImages with these new images, then:
                
    [checkbox1 setBackgroundImage:[UIImage imageNamed:@"notselectedcheckbox.png"] forState:UIControlStateNormal];
    [checkbox1 setBackgroundImage:[UIImage imageNamed:@"selectedcheckbox.png"] forState:UIControlStateSelected];
    [checkbox1 setBackgroundImage:[UIImage imageNamed:@"selectedcheckbox.png"]forState:UIControlStateHighlighted];
    checkbox1.adjustsImageWhenHighlighted=YES;
    [checkbox1 addTarget checkBoxSelected];
    [self.view addSubview:checkbox];
                 
                 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)checkboxSelected:(id)sender
{
    checkboxSelected = !checkboxSelected;
    [checkbox setSelected:checkboxSelected];
}
                 
- (IBAction)saveButtonPressed:(id)sender {
}*/


@end
