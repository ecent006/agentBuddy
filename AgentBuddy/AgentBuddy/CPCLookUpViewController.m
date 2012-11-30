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
}

- (IBAction)searchClaimNumber:(id)sender {
}
@end
