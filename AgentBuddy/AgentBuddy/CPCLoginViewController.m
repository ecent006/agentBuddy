//  PROGRAMMER: Erick Centeno, Jonathan Ciurdar, Ruben Prieto (Group #3)
//  PANTHERID: 3577011, 
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 136
//  ASSIGNMENT:     Semester Project 
//  DUE:            Thursday 12/06/12
//

#import "CPCLoginViewController.h"
#import "CPCMenuViewController.h"
//#import "CPCAppDelegate.h"
 #import "CPCLogin.h"

@interface CPCLoginViewController ()
{
    
    CPCLogin *loginQuery;
        
   
  
}

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
    //To display when text field become first responders
    //
    agentUsername.inputAccessoryView = keyboardNavigateToolBar;
    agentPassword.inputAccessoryView = keyboardNavigateToolBar;
    //Must assign the delegate to self for the firstresponder to work after return key are presssed
    self.agentUsername.delegate= self;
    self.agentPassword.delegate=self;
    
 //Database instances from the delegate
    loginQuery=[[CPCLogin alloc] init];
    
   
    [loginQuery getLogininfo];
    
    
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
   //UIview if uitextfield are empty
    if ([agentUsername.text isEqualToString:@""] || [agentPassword.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Error" message:@"Please check that your username and password are input correctly" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }

      //Database Validation
   
    if([loginQuery.nameArray containsObject:self.agentUsername.text] && [loginQuery.passwordArray containsObject:self.agentPassword.text]){
              //Login checks out push the menu view
              UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
               CPCMenuViewController *menuViewController = [storyboard instantiateViewControllerWithIdentifier:@"Menu"];
               [self.navigationController pushViewController:menuViewController animated:YES];
           
    }
    else {
    //Incorrect input give a alert
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Credentials Invalid" message:@"Please check that your username and password are correct, or contact DB administrator" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    }

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
