//
//  CPCViewController.m
//  AgentBuddy
//
//  Created by Lion User on 10/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CPCLoginViewController.h"

@interface CPCLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *agentUsername;
@property (weak, nonatomic) IBOutlet UITextField *agentPassword;
@property (nonatomic, retain) UIToolbar *keyboardNavigateToolBar;
@end

@implementation CPCLoginViewController
@synthesize agentUsername;
@synthesize agentPassword;
@synthesize keyboardNavigateToolBar;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
    agentUsername.inputAccessoryView = keyboardNavigateToolBar;
    agentPassword.inputAccessoryView = keyboardNavigateToolBar;
    //Must assign the delegate to self for the firstresponder to work after return key are presssed
    self.agentUsername.delegate= self;
    self.agentPassword.delegate=self;
}

- (void)viewDidUnload
{
    
    
    [self setAgentUsername:nil];
    [self setAgentPassword:nil];
    [self setKeyboardNavigateToolBar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}



- (IBAction)loginIn:(id)sender {
    
}

-(void)previousField:(id)sender {
    if([agentUsername isFirstResponder])
        [agentPassword becomeFirstResponder];
    else if ([agentPassword isFirstResponder]) 
        [agentUsername becomeFirstResponder];
    
}
-(void)nextField:(id)sender {
    if([agentUsername isFirstResponder])
        [agentPassword becomeFirstResponder];
    else if ([agentPassword isFirstResponder]) 
        [agentUsername becomeFirstResponder];
    
}

#pragma mark -
#pragma mark UITextFieldDelegate


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [agentUsername resignFirstResponder];
    [agentPassword resignFirstResponder];
    [super touchesBegan:touches withEvent:event];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	if (textField == agentUsername) {
		[textField resignFirstResponder];
		[agentPassword becomeFirstResponder];
	} 
	else if (textField == agentPassword) {
		[textField resignFirstResponder];

	}
	
	return YES;
}





@end
