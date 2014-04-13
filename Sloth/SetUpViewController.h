//
//  SetUpViewController.h
//  Sloth
//
//  Created by Kartik Chillakanti on 4/12/14.
//  Copyright (c) 2014 SKAD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Punishment.h"

typedef void(^InputCompletionHander)(NSString *inputText);

@interface SetUpViewController : UIViewController <PunishmentTableViewControllerDelegate, UIImagePickerControllerDelegate>
@property (copy, nonatomic) InputCompletionHander completionHandler;

@end
