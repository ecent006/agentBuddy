//
//  CPCNewClaimViewController.m
//  AgentBuddy
//
//  Created by Lion User on 12/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CPCNewClaimViewController.h"
#import "CPCCustomerInfo.h"

@interface CPCNewClaimViewController ()
{
    UIDatePicker  *datePicker;
    
}
@property (nonatomic, retain) IBOutlet UIDatePicker *datePicker;
@end

@implementation CPCNewClaimViewController{
     
    CPCCustomerInfo *customer;
    
}
@synthesize datePicker;
@synthesize customerNumber;
@synthesize firstName;
@synthesize lastName;
@synthesize address;
@synthesize city;
@synthesize state;
@synthesize zipCode;
@synthesize email;
@synthesize phoneNumber;
@synthesize birthDate;
@synthesize licenseNumber;

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
    customer=[[CPCCustomerInfo alloc] init];
}

- (void)viewDidUnload
{
    [self setFirstName:nil];
    [self setLastName:nil];
    [self setAddress:nil];
    [self setCity:nil];
    [self setState:nil];
    [self setZipCode:nil];
    [self setEmail:nil];
    [self setPhoneNumber:nil];
    [self setBirthDate:nil];
    [self setLicenseNumber:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}
- (IBAction)showCalendar:(id)sender {
    
    //Presss to show datepicker and press again to remove and destroy
    if (datePicker ==nil) {
        
        datePicker = [[UIDatePicker alloc] init];
        datePicker.datePickerMode=UIDatePickerModeDate;
        [datePicker setFrame:CGRectMake(300,100,320,220)];
        [datePicker setMaximumDate:[NSDate date] ];    
        [datePicker addTarget:self action:@selector(finishSelecting) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:datePicker];
    }
    else {
        [datePicker removeFromSuperview];
        datePicker =nil;
    }
}

-(void)finishSelecting{
    //Dismiss Datepicker after selection
    NSDateFormatter *dateFormatter =[[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    [self.birthDate setText:[dateFormatter stringFromDate:datePicker.date]];
    
    
    
}


- (IBAction)btnContinue:(id)sender {
   
    customerNumber  = [NSString stringWithFormat:@"%0.5u", arc4random()];
    
      
    
    
    [customer storeCustomerInfo:customerNumber andFirstName:firstName.text andLastName:lastName.text andAddress:address.text andCity:city.text andState:state.text andZipCode:zipCode.text andEmail:email.text andPhoneNumber:phoneNumber.text andBirthDate:birthDate.text andLicenseNumber:licenseNumber.text];
    
    NSLog(@"%@, %@, %@, %@, %@, %@ ,%@ ,%@ ,%@ ,%@ ,%@", customerNumber, firstName.text, lastName.text, address.text, city.text, state.text, zipCode.text, email.text, phoneNumber.text , birthDate.text, licenseNumber.text);
}
@end
