//
//  CPCClaimReportViewController.m
//  AgentBuddy
//
//  Created by Lion User on 12/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CPCClaimReportViewController.h"

@implementation CPCClaimReportViewController
@synthesize vinField;
@synthesize modelField;
@synthesize makeField;
@synthesize yearField;
@synthesize colorField;
@synthesize licensePlateField;
@synthesize noteField;
@synthesize customerNameField;

-(void) viewDidLoad
{
    CPCCustomerInfo *activeCustomer = [[CPCDataClass sharedInstance] customerInfo];
    
    self.vinField.text = [[activeCustomer activeClaim] vinNumber];
    self.customerNameField.text = [NSString stringWithFormat:@"%@, %@",[activeCustomer lastName], [activeCustomer firstName]];
    self.modelField.text = [[activeCustomer activeClaim] model];
    self.makeField.text = [[activeCustomer activeClaim] make];
    self.yearField.text = [[activeCustomer activeClaim] vehicleYear];
    self.colorField.text = [[activeCustomer activeClaim] vehicleColor];
    self.licensePlateField.text = [[activeCustomer activeClaim] licensePlateNumber];
    self.noteField.text = [[activeCustomer activeClaim] note];
}

- (void)viewDidUnload {
    [self setVinField:nil];
    [self setModelField:nil];
    [self setMakeField:nil];
    [self setYearField:nil];
    [self setColorField:nil];
    [self setLicensePlateField:nil];
    [self setNoteField:nil];
    [self setCustomerNameField:nil];
    [super viewDidUnload];
}
@end
