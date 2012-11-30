//
//  CPCNewClaimViewController.m
//  AgentBuddy
//
//  Created by Lion User on 12/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CPCNewClaimViewController.h"
#import "CPCCustomerInfo.h"
#import "CPCNewClaimViewController2.h"

@interface CPCNewClaimViewController ()
{
    UIDatePicker  *datePicker;
    
}
@property (nonatomic, retain) UIToolbar *keyboardNavigateToolBar;

@property (nonatomic, retain) IBOutlet UIDatePicker *datePicker;
@end

@implementation CPCNewClaimViewController{
     
    CPCCustomerInfo *customer;
    
}
@synthesize keyboardNavigateToolBar;
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
    
    //Add a previous and a next toolbar to move from one textfield to the next one or previous one.
    if(keyboardNavigateToolBar ==nil)
    {
        keyboardNavigateToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
        
        UIBarButtonItem * previousButton = [[UIBarButtonItem alloc] initWithTitle:@"Previous" 
                                                                            style:UIBarButtonItemStyleBordered 
                                                                           target:self 
                                                                           action:@selector(previousField:)];
        
        
        
        UIBarButtonItem * nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" 
                                                                        style:UIBarButtonItemStyleBordered 
                                                                       target:self 
                                                                       action:@selector(nextField:)];
        
        previousButton.width=70.0f;
        nextButton.width=70.0f;
        
        [keyboardNavigateToolBar setItems:[[NSArray alloc] initWithObjects:previousButton,nextButton, nil]];
        
        
        
    }
    firstName.inputAccessoryView = keyboardNavigateToolBar;
    lastName.inputAccessoryView = keyboardNavigateToolBar;
    address.inputAccessoryView = keyboardNavigateToolBar;
    city.inputAccessoryView = keyboardNavigateToolBar;
    state.inputAccessoryView = keyboardNavigateToolBar;
    zipCode.inputAccessoryView = keyboardNavigateToolBar;
    email.inputAccessoryView = keyboardNavigateToolBar;
    phoneNumber.inputAccessoryView = keyboardNavigateToolBar;
    birthDate.inputAccessoryView = keyboardNavigateToolBar;
    licenseNumber.inputAccessoryView = keyboardNavigateToolBar;
    
   
    //Must assign the delegate to self for the firstresponder to work after return key are presssed
    self.firstName.delegate= self;
    self.lastName.delegate=self;
    self.address.delegate= self;
    self.city.delegate=self;
    self.state.delegate= self;
    self.zipCode.delegate=self;
    self.email.delegate= self;
    self.phoneNumber.delegate=self;
    self.birthDate.delegate= self;
    self.licenseNumber.delegate=self;
    
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
    //customer=nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)previousField:(id)sender {
    if([firstName isFirstResponder])
        [licenseNumber becomeFirstResponder];
    else if ([lastName isFirstResponder]) 
        [firstName becomeFirstResponder];
    else if ([address isFirstResponder]) 
        [lastName becomeFirstResponder];
    else if ([city isFirstResponder]) 
        [address becomeFirstResponder];
    else if ([state isFirstResponder]) 
        [city becomeFirstResponder];
    else if ([zipCode isFirstResponder]) 
        [state becomeFirstResponder];
    else if ([email isFirstResponder]) 
        [zipCode becomeFirstResponder];
    else if ([phoneNumber isFirstResponder]) 
        [email becomeFirstResponder];
    else if ([birthDate isFirstResponder]) 
        [phoneNumber becomeFirstResponder];
    else if ([licenseNumber isFirstResponder]) 
        [birthDate becomeFirstResponder];
    
}
-(void)nextField:(id)sender {
    if([firstName isFirstResponder])
        [lastName becomeFirstResponder];
    else if ([lastName isFirstResponder]) 
        [address becomeFirstResponder];
    else if ([address isFirstResponder]) 
        [city becomeFirstResponder];
    else if ([city isFirstResponder]) 
        [state becomeFirstResponder];
    else if ([state isFirstResponder]) 
        [zipCode becomeFirstResponder];
    else if ([zipCode isFirstResponder]) 
        [email becomeFirstResponder];
    else if ([email isFirstResponder]) 
        [phoneNumber becomeFirstResponder];
    else if ([phoneNumber isFirstResponder]) 
        [birthDate becomeFirstResponder];
    else if ([birthDate isFirstResponder]) 
        [licenseNumber becomeFirstResponder];
    else if ([licenseNumber isFirstResponder]) 
        [firstName becomeFirstResponder];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [firstName resignFirstResponder];
    [lastName resignFirstResponder];
    [address resignFirstResponder];
    [city resignFirstResponder];
    [state resignFirstResponder];
    [zipCode resignFirstResponder];
    [email resignFirstResponder];
    [phoneNumber resignFirstResponder];
    [birthDate resignFirstResponder];
    [licenseNumber resignFirstResponder];
    [super touchesBegan:touches withEvent:event];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	if (textField == firstName) {
		[textField resignFirstResponder];
		[lastName becomeFirstResponder];
	} 
	else if (textField == lastName) {
		[textField resignFirstResponder];
        [address becomeFirstResponder];
        
	}
    else if (textField == address) {
		[textField resignFirstResponder];
        [city becomeFirstResponder];
        
	}
    else if (textField == city) {
		[textField resignFirstResponder];
        [state becomeFirstResponder];
        
        
	}
    else if (textField == state) {
		[textField resignFirstResponder];
        [zipCode becomeFirstResponder];
        
	}
    else if (textField == zipCode) {
		[textField resignFirstResponder];
        [email becomeFirstResponder];
        
	}
    else if (textField == email) {
		[textField resignFirstResponder];
        [phoneNumber becomeFirstResponder];
        
	}else if (textField == phoneNumber) {
		[textField resignFirstResponder];
        [birthDate becomeFirstResponder];
        
	}
    else if (textField == birthDate) {
		[textField resignFirstResponder];
        [licenseNumber becomeFirstResponder];

    }
	else if (textField == licenseNumber) {
		[textField resignFirstResponder];
       
    }
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
   
    
    if ([firstName.text isEqualToString:@""] || [lastName.text isEqualToString:@""]|| [address.text isEqualToString:@""] || [city.text isEqualToString:@""] || [state.text isEqualToString:@""] || [zipCode.text isEqualToString:@""] || [email.text isEqualToString:@""] || [phoneNumber.text isEqualToString:@""]|| [licenseNumber.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Do not leave anything blank" message:@"Please make sure you fully completed the text fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
   

      customerNumber  = [NSString stringWithFormat:@"%0.5u", arc4random()];
    
    
    [customer storeCustomerInfo:customerNumber andFirstName:firstName.text andLastName:lastName.text andAddress:address.text andCity:city.text andState:state.text andZipCode:zipCode.text andEmail:email.text andPhoneNumber:phoneNumber.text andBirthDate:birthDate.text andLicenseNumber:licenseNumber.text];
    
    if (datePicker !=nil) {
        [datePicker removeFromSuperview];
        datePicker =nil;
    }
    
    NSLog(@"%@", customerNumber);
    
    CPCNewClaimViewController2 *newClaimViewController2= [[CPCNewClaimViewController2 alloc] init];
    newClaimViewController2 = [self.storyboard instantiateViewControllerWithIdentifier:@"newClaim2"]; 
    [self.navigationController pushViewController:newClaimViewController2 animated:YES];

}


@end
