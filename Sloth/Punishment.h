//
//  PunishmentTableTableViewController.h
//  Sloth
//
//  Created by Kartik Chillakanti on 4/12/14.
//  Copyright (c) 2014 SKAD. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PunishmentTableViewControllerDelegate <NSObject>

@required
- (void)itemSelectedatRow:(NSInteger)row;

@end

@interface Punishment : UITableViewController

@property (strong, nonatomic) NSArray *punishments;
@property (assign, nonatomic) id<PunishmentTableViewControllerDelegate> delegate;

@end

