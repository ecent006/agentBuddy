//
//  CPCEditClaimByCustomerViewController.m
//  AgentBuddy
//
//  Created by Lion User on 29/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CPCEditClaimByCustomerViewController.h"
#import "CPCEditByCustomer2ViewController.h"

@implementation CPCEditClaimByCustomerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)viewDidLoad
{
      [super viewDidLoad];
     
    customerList = [[NSMutableArray alloc] init];
    [self getCustomerInfo];

}

- (void)viewDidUnload
{
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
   
    //[myTableView reloadData];
}

-(NSString *) getDBPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    
    return [documentsDir stringByAppendingPathComponent:@"MyDatabase.sqlite"];
}

-(void) getCustomerInfo
{
    [customerList removeAllObjects];
    if (sqlite3_open([[self getDBPath] UTF8String], &database)== SQLITE_OK) {
        const char *sql1 = "SELECT fldCustomerNumber, fldFirstName, fldLastName FROM tblCustomer order by fldLastName asc";
        sqlite3_stmt *selectstmt1;
        if(sqlite3_prepare_v2(database, sql1, -1, &selectstmt1, NULL)==SQLITE_OK) {
            
            while (sqlite3_step(selectstmt1)==SQLITE_ROW) 
            {
                NSString *customerNumber = [NSString stringWithUTF8String:(char *) sqlite3_column_text(selectstmt1, 0)];
                NSString *firstName=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 1)];
                NSString *lastName=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 2)];
                
                CPCCustomerInfo *tempCust = [[CPCCustomerInfo alloc] init];
                [tempCust setCustomerNum:customerNumber andFirstName:firstName andLastName:lastName];
                
                [customerList addObject:tempCust];
                
            }
            sqlite3_finalize(selectstmt1);
        }
    }
    else {
        
        
        sqlite3_close(database);
    }

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [customerList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // tableView.backgroundColor = [UIColor colorWithRed:0.176 green:0.486 blue:1 alpha:1];
    //Eliminate the display of the background of the tableview
    tableView.opaque = NO;
    tableView.backgroundView = nil;
    
    
    // Configure the cell...
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //Customization of cell
 
    NSString *name=[NSString stringWithFormat:@"%@       %@, %@",[[customerList objectAtIndex:indexPath.row] customerNumber],[[customerList objectAtIndex:indexPath.row] lastName], [[customerList objectAtIndex:indexPath.row] firstName]];
    cell.textLabel.text = name;
    cell.textLabel.textAlignment=UITextAlignmentLeft; //Center the text on the cells
    
    
    
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
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *customerNumber = [[customerList objectAtIndex:indexPath.row ] customerNumber];
    [[[CPCDataClass sharedInstance] customerInfo] setCurrentCustomerByCustomerID:customerNumber];
        
    CPCEditByCustomer2ViewController *editByCustomer2ViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"editClaim2"]; 
    [self.navigationController pushViewController:editByCustomer2ViewController animated:YES];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
