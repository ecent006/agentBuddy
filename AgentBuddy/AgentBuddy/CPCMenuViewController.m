//  PROGRAMMER: Erick Centeno, Jonathan Ciurdar, Ruben Prieto (Group #3)
//  PANTHERID: 3577011, 
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 136
//  ASSIGNMENT:     Semester Project 
//  DUE:            Thursday 12/06/12
//


#import "CPCMenuViewController.h"
#import "CPCNewClaimViewController.h"
#import "CPCEditClaimByCustomerViewController.h"
#import "CPCLookUpViewController.h"

@interface CPCMenuViewController ()
@end



@implementation CPCMenuViewController
@synthesize menuList;


//- (id)initWithStyle:(UITableViewStyle)style
//{
//    self = [super initWithStyle:style];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    NSArray *array = [[NSArray alloc] initWithObjects:@"New Customer",@"Add Claim By Existing Customer", @"View/Edit Claim By Customer", @"Look Up",nil];
    self.menuList = array;
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
   

}

- (void)viewDidUnload
{
     [self setMenuList:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

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
  return [self.menuList count];
;
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
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [menuList objectAtIndex:row];
    cell.textLabel.textAlignment=UITextAlignmentCenter; //Center the text on the cells
    


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
    CPCNewClaimViewController *newClaimViewController = [[CPCNewClaimViewController alloc] init];
    CPCEditClaimByCustomerViewController *editClaimViewController= [[CPCEditClaimByCustomerViewController alloc] init];
    CPCLookUpViewController *lookUpViewController=
    [[CPCLookUpViewController alloc]init];

    switch(indexPath.row)
    {
            case 0:
          newClaimViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"claim"]; 
            [self.navigationController pushViewController:newClaimViewController animated:YES];
            break;
            case 1:
            //Send them to choose customer
            editClaimViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"editClaim"]; 
            [self.navigationController pushViewController:editClaimViewController animated:YES];
            [[CPCDataClass sharedInstance] setAddClaimState:YES];
            [[CPCDataClass sharedInstance] setEditClaimState:NO];
            
            break;
           case 2:
            editClaimViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"editClaim"]; 
            [self.navigationController pushViewController:editClaimViewController animated:YES];
            [[CPCDataClass sharedInstance] setAddClaimState:NO];
            [[CPCDataClass sharedInstance] setEditClaimState:YES];
            break;
            case 3:
            lookUpViewController =[self.storyboard 
                                   instantiateViewControllerWithIdentifier:@"lookUp"];
            [self.navigationController pushViewController:lookUpViewController
                                                 animated:YES];
            
    
    }                                                    
 
}



@end
