//
//  SectionsTable.m
//  Sloth
//
//  Created by Samir Lavingia on 12/04/2014.
//  Copyright (c) 2014 SKAD. All rights reserved.
//

#import "SectionsTable.h"
#import "SectionModel.h"

@interface SectionsTable ()

@end

@implementation SectionsTable

static NSInteger rowThatWasPicked;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [[SectionModel getSections] count];
;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
      cell = [[UITableViewCell alloc] init];
    }
  
    NSMutableString *labelString = [[NSMutableString alloc] init];
    [labelString appendString:[[[SectionModel getSections] objectAtIndex:indexPath.row] sectionName]];
    [labelString appendString: @": "];
    [labelString appendString:[[[SectionModel getSections] objectAtIndex:indexPath.row] startTime]];
    [labelString appendString: @" - "];
    [labelString appendString:[[[SectionModel getSections] objectAtIndex:indexPath.row] endTime]];
    cell.textLabel.text = labelString;
//  cell.detailTextLabel.text = [[[SectionModel getSections] objectAtIndex:indexPath.row] startTime] ,"asdf", [[[SectionModel getSections] objectAtIndex:indexPath.row] startTime];


    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ChoseSection"]) {
      //[segue.destinationViewController setImageURL:[NSURL URLWithString:photo.imageURL]];
      //[segue.destinationViewController setTitle:photo.title];
    }    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
  NSLog(@"asdfads");
  rowThatWasPicked = indexPath.row;
  //self.selectedCellText = [[[tableView cellForRowAtIndexPath:indexPath] textLabel] text];
  [self performSegueWithIdentifier:@"ChoseSection" sender:self];
  //[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

+ (NSInteger) rowThatWasPicked
{
  return rowThatWasPicked;
}

@end
