//
//  CPCLookUpViewController.m
//  AgentBuddy
//
//  Created by Lion User on 30/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
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
}

- (IBAction)searchCustomerID:(id)sender {
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

- (IBAction)searchClaimNumber:(id)sender {
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
@end
