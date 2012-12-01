//
//  CPCNewClaimViewController2.m
//  AgentBuddy
//
//  Created by Lion User on 29/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CPCNewClaimViewController2.h"

@interface  CPCNewClaimViewController2() {
    
}
@property (nonatomic, retain) UIToolbar *keyboardNavigateToolBar;
@end
@implementation CPCNewClaimViewController2
@synthesize vinNumber;
@synthesize model;
@synthesize make;
@synthesize year;
@synthesize color;
@synthesize licensePlateNumber;
@synthesize claimNotes;
@synthesize picture1;
@synthesize picture2;
@synthesize customerLabel;


@synthesize  keyboardNavigateToolBar;

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
    vinNumber.inputAccessoryView = keyboardNavigateToolBar;
    model.inputAccessoryView = keyboardNavigateToolBar;
    make.inputAccessoryView = keyboardNavigateToolBar;
    year.inputAccessoryView = keyboardNavigateToolBar;
    color.inputAccessoryView = keyboardNavigateToolBar;
    licensePlateNumber.inputAccessoryView = keyboardNavigateToolBar;
    claimNotes.inputAccessoryView = keyboardNavigateToolBar;
  
    
    
    //Must assign the delegate to self for the firstresponder to work after return key are presssed
    self.vinNumber.delegate= self;
    self.model.delegate=self;
    self.make.delegate= self;
    self.year.delegate=self;
    self.color.delegate= self;
    self.licensePlateNumber.delegate=self;
    self.claimNotes.delegate= self;
    
    CPCCustomerInfo *customerInfo = [[CPCDataClass sharedInstance] customerInfo];
    customerLabel.text = [NSString stringWithFormat:@"%@, %@", [customerInfo lastName], [customerInfo firstName]];
    
}


- (void)viewDidUnload {
    [self setVinNumber:nil];
    [self setModel:nil];
    [self setMake:nil];
    [self setYear:nil];
    [self setColor:nil];
    [self setLicensePlateNumber:nil];
    [self setClaimNotes:nil];
    [self setPicture1:nil];
    [self setPicture2:nil];
    [self setCustomerLabel:nil];
    [super viewDidUnload];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void)previousField:(id)sender {
    if([vinNumber isFirstResponder])
        [claimNotes becomeFirstResponder];
    else if ([model isFirstResponder]) 
        [vinNumber becomeFirstResponder];
    else if ([make isFirstResponder]) 
        [model becomeFirstResponder];
    else if ([year isFirstResponder]) 
        [make becomeFirstResponder];
    else if ([color isFirstResponder]) 
        [year becomeFirstResponder];
    else if ([licensePlateNumber isFirstResponder]) 
        [color becomeFirstResponder];
    else if ([claimNotes isFirstResponder]) 
        [licensePlateNumber becomeFirstResponder];
 
    
}
-(void)nextField:(id)sender {
    if([vinNumber isFirstResponder])
        [model becomeFirstResponder];
    else if ([model isFirstResponder]) 
        [make becomeFirstResponder];
    else if ([make isFirstResponder]) 
        [year becomeFirstResponder];
    else if ([year isFirstResponder]) 
        [color becomeFirstResponder];
    else if ([color isFirstResponder]) 
        [licensePlateNumber becomeFirstResponder];
    else if ([licensePlateNumber isFirstResponder]) 
        [claimNotes becomeFirstResponder];
    else if ([claimNotes isFirstResponder]) 
        [vinNumber becomeFirstResponder];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [vinNumber resignFirstResponder];
    [model resignFirstResponder];
    [year resignFirstResponder];
    [color resignFirstResponder];
    [licensePlateNumber resignFirstResponder];
    [claimNotes resignFirstResponder];
   
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	if (textField == vinNumber) {
		[textField resignFirstResponder];
		[model becomeFirstResponder];
	} 
	else if (textField == model) {
		[textField resignFirstResponder];
        [year becomeFirstResponder];
        
	}
    else if (textField == year) {
		[textField resignFirstResponder];
        [color becomeFirstResponder];
        
	}
    else if (textField == color) {
		[textField resignFirstResponder];
        [licensePlateNumber becomeFirstResponder];
        
        
	}
    else if (textField == licensePlateNumber) {
		[textField resignFirstResponder];
        [claimNotes becomeFirstResponder];
       
        
	}
      
	return YES;
}
@end
