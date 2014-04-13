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

bool checkBoxSelected;
UIButton *checkbox1;


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

    checkbox1 = [[UIButton alloc] initWithFrame:CGRectMake(0,0,200,200)];
    [checkbox1 setBackgroundImage:[UIImage imageNamed:@"Images/unchecked_box.png"] forState:UIControlStateNormal];
    [checkbox1 setBackgroundImage:[UIImage imageNamed:@"Images/checked_box.png"] forState:UIControlStateSelected];
    [checkbox1 setBackgroundImage:[UIImage imageNamed:@"Images/unchecked_box.png"]forState:UIControlStateHighlighted];
    checkbox1.adjustsImageWhenHighlighted=YES;
    [checkbox1 addTarget:self action:@selector(checkboxSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:checkbox1];
}
 

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)checkboxSelected:(id)sender
{
    checkBoxSelected = ! checkBoxSelected;
    [checkbox1 setSelected: !checkBoxSelected];
}

- (IBAction)saveButtonPressed:(id)sender {
}


@end
