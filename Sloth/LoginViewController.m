//
//  Copyright (c) 2013 Parse. All rights reserved.

#import "LoginViewController.h"
#import "UserDetailsViewController.h"
#import <Parse/Parse.h>
#import "SetUpViewController.h"
#import "ViewController.h"

@implementation LoginViewController


#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Facebook Profile";
    
//    if ([PFUser currentUser]) {
//        [PFFacebookUtils unlinkUser:[PFUser currentUser]];
//
//    }
    // Check if user is cached and linked to Facebook, if so, bypass login
    if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
      if (![@"1" isEqualToString:[[NSUserDefaults standardUserDefaults]
                                  objectForKey:@"firstTimer"]]) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SetUpViewController *viewController = (SetUpViewController *)[storyboard instantiateViewControllerWithIdentifier:@"AfterLoginVC"];
        [self presentViewController:viewController animated:YES completion:nil];
        
      }else{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *viewController = (ViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self presentViewController:viewController animated:YES completion:nil];
      }
      
      
    }
}

/*
 
 [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:@"firstTimer"];
 [[NSUserDefaults standardUserDefaults] synchronize];
 
 */

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  
  
  return self;
}


#pragma mark - Login mehtods

/* Login to facebook method */
- (IBAction)loginButtonTouchHandler:(id)sender  {
    // Set permissions required from the facebook user account
    NSArray *permissionsArray = @[ @"user_about_me", @"user_relationships", @"user_birthday", @"user_location"];
    
    // Login PFUser using facebook
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        [_activityIndicator stopAnimating]; // Hide loading indicator
        
        if (!user) {
            if (!error) {
                NSLog(@"Uh oh. The user cancelled the Facebook login.");
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log In Error" message:@"Uh oh. The user cancelled the Facebook login." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Dismiss", nil];
                [alert show];
            } else {
                NSLog(@"Uh oh. An error occurred: %@", error);
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log In Error" message:[error description] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Dismiss", nil];
                [alert show];
            }
        } else if (user.isNew) {
            NSLog(@"User with facebook signed up and logged in!");
            //[self.navigationController pushViewController:[[UserDetailsViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
            
            [[FBRequest requestForMe] startWithCompletionHandler:^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *FBuser, NSError *error) {
                if (error) { }
                else { NSString *username = [FBuser name];
                       NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                      [defaults setObject:username forKey:@"username"];
                    NSLog(@"Username: %@", username);
                        }
            }];
            
          if (![@"1" isEqualToString:[[NSUserDefaults standardUserDefaults]
                                      objectForKey:@"firstTimer"]]) {
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            SetUpViewController *viewController = (SetUpViewController *)[storyboard instantiateViewControllerWithIdentifier:@"AfterLoginVC"];
            [self presentViewController:viewController animated:YES completion:nil];
            
          }else{
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ViewController *viewController = (ViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
            [self presentViewController:viewController animated:YES completion:nil];
          }

        } else {
            NSLog(@"User with facebook logged in!");
              //[self.navigationController pushViewController:[[UserDetailsViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
           
          if (![@"1" isEqualToString:[[NSUserDefaults standardUserDefaults]
                                      objectForKey:@"firstTimer"]]) {
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            SetUpViewController *viewController = (SetUpViewController *)[storyboard instantiateViewControllerWithIdentifier:@"AfterLoginVC"];
            [self presentViewController:viewController animated:YES completion:nil];
            
          }else{
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ViewController *viewController = (ViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
            [self presentViewController:viewController animated:YES completion:nil];
          }
        }
    }];
    
    [_activityIndicator startAnimating]; // Show loading indicator until login is finished
}

@end
