//
//  SectionsTable.h
//  Sloth
//
//  Created by Samir Lavingia on 12/04/2014.
//  Copyright (c) 2014 SKAD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionsTable : UITableViewController <UITableViewDelegate, UITableViewDataSource>
    +(NSInteger) rowThatWasPicked;
@end
