//
//  CPCEditByCustomer2ViewController.m
//  AgentBuddy
//
//  Created by Lion User on 29/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CPCEditByCustomer2ViewController.h"

@implementation CPCEditByCustomer2ViewController

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
    
    CPCCustomerInfo *customerInfo = [[CPCDataClass sharedInstance] customerInfo];
    claimsList = [customerInfo claimsList];
    
    if([claimsList count] == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Claims Available" message:@"There are no claims available for this Customer." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
}

- (void)viewDidUnload
{
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
  // [self.myTableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
  //  NSLog(@"%@",[customer lastNameArray] );
  return [claimsList count];
    
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
    
   NSString *name=[NSString stringWithFormat:@"%@     %@",[[claimsList objectAtIndex:indexPath.row]claimNumber],[[claimsList objectAtIndex:indexPath.row ]note]];
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
    //Navigation logic may go here. Create and push another view controller from the menuView
    //CPCEditByCustomer2ViewController *editByCustomer2ViewController = [[CPCEditByCustomer2ViewController alloc] init];
    
    switch(indexPath.row)
    {
        case 0:
            // newClaimViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"claim"]; 
            // [self.navigationController pushViewController:newClaimViewController animated:YES];
            break;
            // case 1:
            
            
    }                                                    
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
