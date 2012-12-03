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
- (IBAction)btnUpdate:(id)sender {
    
    CPCCarInfo *tempClaim = [[CPCCarInfo alloc] init];
    [tempClaim setClaimNumber:nil andNote:self.noteField.text andDateCreated:nil andDateExpires:nil andVehicleModel:self.modelField.text andVehicleMake:self.makeField.text andVehicleYear:self.yearField.text andVehicleColor:self.colorField.text andCustomerNumber:nil andLicensePlateNumber:self.licensePlateField.text andVinNumber:self.vinField.text];
    
    [[[[CPCDataClass sharedInstance] customerInfo] activeClaim ] updateClaimInfo:tempClaim];
}

- (IBAction)btnMail:(id)sender {
    //Erick Centeno Extra credit api mail the report
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    if(mailClass !=nil){
    MFMailComposeViewController *mailComposeViewController=[[MFMailComposeViewController alloc] init];  
     mailComposeViewController.mailComposeDelegate = self;  
    [mailComposeViewController setSubject:[NSString stringWithFormat:@"Claim Report of Customer: %@", self.customerNameField.text]];
    
    NSString *messageBody=[[NSString alloc] initWithFormat:@" Name: %@ <br />Vin#: %@ <br />Model: %@ <br />Make: %@ <br />Year: %@ <br />Color: %@ <br />License Plate #: %@ <br />Notes: %@ ",self.customerNameField.text, self.vinField.text, self.modelField.text,self.makeField.text, self.yearField.text,self.colorField.text, self.licensePlateField.text, self.noteField.text];

    
    
    // getting path for the image we have in the tutorial project  
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Logo" ofType:@"png"];  
    
    // loading content of the image into NSData with claim pictures  
    NSData *imageData = [NSData dataWithContentsOfFile:path];
    
     [mailComposeViewController addAttachmentData:imageData mimeType:@"image/png" fileName:@"Logo"]; 
    
    [mailComposeViewController setMessageBody:messageBody isHTML:YES];
      if([mailClass canSendMail])
     [self presentModalViewController:mailComposeViewController animated:YES];  
    }  
}


- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {  
    // switchng the result  
    switch (result) {  
        case MFMailComposeResultCancelled:  
            NSLog(@"Mail send canceled.");  
            /* 
             Execute your code for canceled event here ... 
             */  
            break;  
        case MFMailComposeResultSaved:  
            NSLog(@"Mail saved.");  
            /* 
             Execute your code for email saved event here ... 
             */  
            break;  
        case MFMailComposeResultSent:  
            NSLog(@"Mail sent.");  
            /* 
             Execute your code for email sent event here ... 
             */  
            break;  
        case MFMailComposeResultFailed:  
            NSLog(@"Mail send error: %@.", [error localizedDescription]);  
            /* 
             Execute your code for email send failed event here ... 
             */  
            break;  
        default:  
            break;  
    }  
    // hide the modal view controller  
    [self dismissModalViewControllerAnimated:YES];  
}  
@end
