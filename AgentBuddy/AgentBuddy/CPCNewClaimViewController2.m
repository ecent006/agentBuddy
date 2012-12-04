//
//  CPCNewClaimViewController2.m
//  AgentBuddy
//
//  Created by Lion User on 29/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CPCNewClaimViewController2.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import "CPCMenuViewController.h"

@interface  CPCNewClaimViewController2() {
    UITouch *selectCamera;
    bool selectPicture1;
    bool selectPicture2;
    bool claimAdded;
 
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
@synthesize storePicture1,storePicture2;


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
    
    claimAdded = NO;
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


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	if (textField == vinNumber) {
		[textField resignFirstResponder];
		[model becomeFirstResponder];
	} 
	else if (textField == model) {
		[textField resignFirstResponder];
        [make becomeFirstResponder];
        
	}
    else if (textField == make) {
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [vinNumber resignFirstResponder];
    [model resignFirstResponder];
    [year resignFirstResponder];
    [color resignFirstResponder];
    [licensePlateNumber resignFirstResponder];
    [claimNotes resignFirstResponder];
    
    selectCamera =[touches anyObject];
    
    if([selectCamera view]== picture1)
    {
        [self startCameraControllerFromViewController: self
                                        usingDelegate: self]; 
        selectPicture1= true;
        
    }
    else if ([selectCamera view]==picture2) {
        [self startCameraControllerFromViewController: self
                                        usingDelegate: self];
        selectPicture2=true;
    }
    
}


#pragma mark - Camera Image Interface

- (BOOL) startCameraControllerFromViewController: (UIViewController*) controller
                                   usingDelegate: (id <UIImagePickerControllerDelegate,
                                                   UINavigationControllerDelegate>) delegate {
    // Does hardware support a camera
    if (([UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeCamera] == NO)
        || (delegate == nil)
        || (controller == nil))
        return NO;
    
    // Create the picker object
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    
    // Specify the types of camera features available
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    
    // Displays a control that allows the user to take pictures only.    
    cameraUI.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeImage, nil];  
    
    
    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    cameraUI.allowsEditing = NO;
    
    // Specify which object contains the picker's methods
    cameraUI.delegate = delegate;
    
    // Picker object view is attached to view hierarchy and displayed.
    [controller presentViewController: cameraUI animated: YES completion: nil ];
    return YES;
}

#pragma mark - Camera Delegate Methods 

// For responding to the user tapping Cancel.
- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker {
    
    [self dismissViewControllerAnimated: YES completion: nil];
    
}

// For responding to the user accepting a newly-captured picture 
// Picker passes a NSDictionary with acquired camera data

- (void) imagePickerController: (UIImagePickerController *) picker
 didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    // Create an image and store the acquired picture
    
    UIImage  *imageToSave;
    
    imageToSave = (UIImage *) [info objectForKey:
                               UIImagePickerControllerOriginalImage];
    
    // Save the new image to the Camera Roll
    UIImageWriteToSavedPhotosAlbum (imageToSave, nil, nil , nil);
    
    // View the image on screen 
    if(selectPicture1 ==true){
    self.picture1.image = imageToSave;
        self.storePicture1 = UIImagePNGRepresentation(self.picture1.image);    
    selectPicture1=false;
    }

    if(selectPicture2==true){
    self.picture2.image = imageToSave; 
        self.storePicture2 = UIImagePNGRepresentation(self.picture2.image);
    selectPicture2=false;
    }   
    // Tell controller to remove the picker from the view hierarchy and release object.
    [self dismissViewControllerAnimated: YES completion: ^{[self doSomethingElse];} ];
    
}

- (void) doSomethingElse {
    NSLog(@"Camera Dismissed");
    
}







- (IBAction)addClaimBtn:(UIButton *)sender 
{
    if ([vinNumber.text isEqualToString:@""] || [model.text isEqualToString:@""]|| [make.text isEqualToString:@""] || [year.text isEqualToString:@""] || [color.text isEqualToString:@""] || [licensePlateNumber.text isEqualToString:@""] || [claimNotes.text isEqualToString:@""] ) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Do not leave anything blank" message:@"Please make sure you fully completed the text fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    CPCCarInfo *tempCarInfo = [[CPCCarInfo alloc] init];
    NSString *claimNumber=[NSString stringWithFormat:@"%0.5u", arc4random()];
    
    [tempCarInfo setClaimNumber:claimNumber 
                 andNote: self.claimNotes.text 
                 andDateCreated:[NSDateFormatter localizedStringFromDate:[NSDate date] dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterNoStyle] 
                 andDateExpires:@"" 
                 andVehicleModel:model.text 
                 andVehicleMake:self.make.text 
                 andVehicleYear:self.year.text 
                 andVehicleColor:self.color.text 
                 andCustomerNumber: [[[CPCDataClass sharedInstance]customerInfo] customerNumber] 
                 andLicensePlateNumber:self.licensePlateNumber.text 
                 andVinNumber:self.vinNumber.text];
    
    [[[CPCDataClass sharedInstance]customerInfo]addClaimToCustomer:tempCarInfo];
    
    
    NSString *messageClaim=[NSString stringWithFormat:@"The Claim has been completed. \n Your Claim Number is: %@",claimNumber];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Claim Completed" message:messageClaim delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    claimAdded = YES;

   
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {
        [self dismissModalViewControllerAnimated:YES];

        //Pop back to Menu View Controller
        if(claimAdded){
            [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
        }

    }
        }
@end
