//
//  CPCClaimReportViewController.m
//  AgentBuddy
//
//  Created by Lion User on 12/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <MobileCoreServices/UTCoreTypes.h>

#import "CPCClaimReportViewController.h"
@interface CPCClaimReportViewController() {
    UITouch *selectCamera;
    bool selectPicture1;
    bool selectPicture2;
}
@property (nonatomic, retain) UIToolbar *keyboardNavigateToolBar;

@end
@implementation CPCClaimReportViewController
@synthesize  keyboardNavigateToolBar;
@synthesize vinField;
@synthesize modelField;
@synthesize makeField;
@synthesize yearField;
@synthesize colorField;
@synthesize licensePlateField;
@synthesize noteField;
@synthesize customerNameField;
@synthesize picture1;
@synthesize picture2;
@synthesize storePicture1,storePicture2;

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
    self.picture1.image = [[activeCustomer activeClaim] picture1];
    self.picture2.image = [[activeCustomer activeClaim] picture2];
    

    
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
    vinField.inputAccessoryView = keyboardNavigateToolBar;
    modelField.inputAccessoryView = keyboardNavigateToolBar;
    makeField.inputAccessoryView = keyboardNavigateToolBar;
    yearField.inputAccessoryView = keyboardNavigateToolBar;
    colorField.inputAccessoryView = keyboardNavigateToolBar;
    licensePlateField.inputAccessoryView = keyboardNavigateToolBar;
    noteField.inputAccessoryView = keyboardNavigateToolBar;
    //Must assign the delegate to self for the firstresponder to work after return key are presssed
    self.vinField.delegate= self;
    self.modelField.delegate=self;
    self.makeField.delegate= self;
    self.yearField.delegate=self;
    self.colorField.delegate= self;
    self.licensePlateField.delegate=self;
    self.noteField.delegate= self;

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

-(void)previousField:(id)sender {
    if([vinField isFirstResponder])
        [noteField becomeFirstResponder];
    else if ([modelField isFirstResponder]) 
        [vinField becomeFirstResponder];
    else if ([makeField isFirstResponder]) 
        [modelField becomeFirstResponder];
    else if ([yearField isFirstResponder]) 
        [makeField becomeFirstResponder];
    else if ([colorField isFirstResponder]) 
        [yearField becomeFirstResponder];
    else if ([licensePlateField isFirstResponder]) 
        [colorField becomeFirstResponder];
    else if ([noteField isFirstResponder]) 
        [licensePlateField becomeFirstResponder];
    
    
}
-(void)nextField:(id)sender {
    if([vinField isFirstResponder])
        [modelField becomeFirstResponder];
    else if ([modelField isFirstResponder]) 
        [makeField becomeFirstResponder];
    else if ([makeField isFirstResponder]) 
        [yearField becomeFirstResponder];
    else if ([yearField isFirstResponder]) 
        [colorField becomeFirstResponder];
    else if ([colorField isFirstResponder]) 
        [licensePlateField becomeFirstResponder];
    else if ([licensePlateField isFirstResponder]) 
        [noteField becomeFirstResponder];
    else if ([noteField isFirstResponder]) 
        [vinField becomeFirstResponder];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	if (textField == vinField) {
		[textField resignFirstResponder];
		[modelField becomeFirstResponder];
	} 
	else if (textField == modelField) {
		[textField resignFirstResponder];
        [makeField becomeFirstResponder];
        
	}
    else if (textField == makeField) {
		[textField resignFirstResponder];
        [yearField becomeFirstResponder];
        
	}
    
    else if (textField == yearField) {
		[textField resignFirstResponder];
        [colorField becomeFirstResponder];
        
	}
    else if (textField == colorField) {
		[textField resignFirstResponder];
        [licensePlateField becomeFirstResponder];
        
        
	}
    else if (textField == licensePlateField) {
		[textField resignFirstResponder];
        [noteField becomeFirstResponder];
        
        
	}
    
	return YES;
}


- (IBAction)btnUpdate:(id)sender {
    if ([vinField.text isEqualToString:@""] || [modelField.text isEqualToString:@""]|| [makeField.text isEqualToString:@""] || [yearField.text isEqualToString:@""] || [colorField.text isEqualToString:@""] || [licensePlateField.text isEqualToString:@""] || [noteField.text isEqualToString:@""] ) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Do not leave anything blank" message:@"Please make sure you fully completed the text fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    
//    NSString *messageClaim=[NSString stringWithFormat:@"The Claim has been updated it"];
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Claim Successfully Updated It" message:messageClaim delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//    [alert show];
    
    CPCCarInfo *tempClaim = [[CPCCarInfo alloc] init];
    [tempClaim setClaimNumber:nil andNote:self.noteField.text andDateCreated:nil andDateExpires:nil andVehicleModel:self.modelField.text andVehicleMake:self.makeField.text andVehicleYear:self.yearField.text andVehicleColor:self.colorField.text andCustomerNumber:nil andLicensePlateNumber:self.licensePlateField.text andVinNumber:self.vinField.text andPicture1:picture1.image andPicture2:picture2.image];
    
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


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [vinField resignFirstResponder];
    [modelField resignFirstResponder];
    [yearField resignFirstResponder];
    [colorField resignFirstResponder];
    [licensePlateField resignFirstResponder];
    [noteField resignFirstResponder];
    
    
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
@end
