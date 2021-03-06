//  PROGRAMMER: Erick Centeno, Jonathan Ciurdar, Ruben Prieto (Group #3)
//  PANTHERID: 3577011, 
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 136
//  ASSIGNMENT:     Semester Project 
//  DUE:            Thursday 12/06/12
//


#import "CPCLookUpViewController.h"

@interface CPCLookUpViewController ()

@end

@implementation CPCLookUpViewController
@synthesize lastName;
@synthesize customerID;
@synthesize claimNumber;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setLastName:nil];
    [self setCustomerID:nil];
    [self setClaimNumber:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)searchLastName:(id)sender {
    if(![lastName.text isEqualToString:@""])
    {
        if([[[CPCDataClass sharedInstance] customerInfo] setCurrentCustomerByCustomerLastName:lastName.text])
        {
            CPCEditByCustomer2ViewController *editByCustomer2ViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"editClaim2"]; 
            [self.navigationController pushViewController:editByCustomer2ViewController animated:YES];
            
        }
        else 
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Customer not found!" message:@"Could not locate Customer based on Customer Last Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Customer Last Name not entered!" message:@"Please enter a Customer Last Name in order to search" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (IBAction)searchCustomerID:(id)sender {
    if(![customerID.text isEqualToString:@""])
    {
        if([[[CPCDataClass sharedInstance] customerInfo] setCurrentCustomerByCustomerID:customerID.text])
        {
            CPCEditByCustomer2ViewController *editByCustomer2ViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"editClaim2"]; 
            [self.navigationController pushViewController:editByCustomer2ViewController animated:YES];
            
        }
        else 
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Customer not found!" message:@"Could not locate Customer based on Customer ID" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Customer Number not entered!" message:@"Please enter a Customer ID in order to search" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (IBAction)searchClaimNumber:(id)sender {
    if(![claimNumber.text isEqualToString:@""])
    {
        if([[[CPCDataClass sharedInstance] customerInfo] searchForClaimByID:claimNumber.text])
        {
            CPCClaimReportViewController *claimReportViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"claimReportView"];
            [self.navigationController pushViewController:claimReportViewController animated:YES];
        }
        else 
        {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Claim not found!" message:@"Could not locate Claim based on Claim ID" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Claim Number Not Entered!" message:@"Please enter a Claim Number in order to search" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}
@end
