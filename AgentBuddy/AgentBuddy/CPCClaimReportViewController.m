//  PROGRAMMER: Erick Centeno, Jonathan Ciurdar, Ruben Prieto (Group #3)
//  PANTHERID: 3577011, 
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 136
//  ASSIGNMENT:     Semester Project 
//  DUE:            Thursday 12/06/12
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
@implementation CPCClaimReportViewController{
CPCCustomerInfo *activeCustomer;
}
@synthesize addressField;
@synthesize emailField;
@synthesize phoneField;
@synthesize birthDateField;
@synthesize licenseNumberField;
@synthesize address2Field;
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
   activeCustomer = [[CPCDataClass sharedInstance] customerInfo];
    
    self.vinField.text = [[activeCustomer activeClaim] vinNumber];
    self.customerNameField.text = [NSString stringWithFormat:@"%@, %@ - %@",[activeCustomer lastName], [activeCustomer firstName], [activeCustomer customerNumber]];
    self.modelField.text = [[activeCustomer activeClaim] model];
    self.makeField.text = [[activeCustomer activeClaim] make];
    self.yearField.text = [[activeCustomer activeClaim] vehicleYear];
    self.colorField.text = [[activeCustomer activeClaim] vehicleColor];
    self.licensePlateField.text = [[activeCustomer activeClaim] licensePlateNumber];
    self.noteField.text = [[activeCustomer activeClaim] note];
    self.picture1.image = [[activeCustomer activeClaim] picture1];
    self.picture2.image = [[activeCustomer activeClaim] picture2];
    self.addressField.text = [activeCustomer houseAddress];
    self.address2Field.text = [NSString stringWithFormat:@"%@ %@, %@", [activeCustomer city], [activeCustomer state], [activeCustomer zipCode]];
    self.emailField.text = [activeCustomer email];
    self.phoneField.text = [activeCustomer phoneNumber];
    self.birthDateField.text = [activeCustomer birthDate];
    self.licenseNumberField.text = [activeCustomer licenseNumber];

    
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
    [self setAddressField:nil];
    [self setEmailField:nil];
    [self setPhoneField:nil];
    [self setBirthDateField:nil];
    [self setLicenseNumberField:nil];
    [self setAddress2Field:nil];
    [super viewDidUnload];
}

-(void)previousField:(id)sender {
    if([vinField isFirstResponder])
        [noteField becomeFirstResponder];
    else if ([makeField isFirstResponder]) 
        [vinField becomeFirstResponder];
    else if ([modelField isFirstResponder]) 
        [makeField becomeFirstResponder];
    else if ([yearField isFirstResponder]) 
        [modelField becomeFirstResponder];
    else if ([colorField isFirstResponder]) 
        [yearField becomeFirstResponder];
    else if ([licensePlateField isFirstResponder]) 
        [colorField becomeFirstResponder];
    else if ([noteField isFirstResponder]) 
        [licensePlateField becomeFirstResponder];
    
    
}
-(void)nextField:(id)sender {
    if([vinField isFirstResponder])
        [makeField becomeFirstResponder];
    else if ([makeField isFirstResponder]) 
        [modelField becomeFirstResponder];
    else if ([modelField isFirstResponder]) 
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
		[makeField becomeFirstResponder];
	} 
	else if (textField == makeField) {
		[textField resignFirstResponder];
        [modelField becomeFirstResponder];
        
	}
    else if (textField == modelField) {
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


- (IBAction)sendToDropbox:(UIButton *)sender {
    if (![[DBSession sharedSession] isLinked]) {
        [[DBSession sharedSession] linkFromController:self];
    }
    
    //get the documents directory:
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    
    //make a file name to write the data to using the documents directory:
    NSString *fileName = [NSString stringWithFormat:@"%@_%@.txt", [activeCustomer customerNumber], [[activeCustomer activeClaim] claimNumber]];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", 
                          documentsDirectory, fileName];

    //create content - four lines of text
    NSString *content = [NSString stringWithFormat:@" Name: %@ \n Customer ID: %@ \n Vin#: %@ \n Model: %@ \n Make: %@ \n Year: %@ \n Color: %@ \n License Plate #: %@ \n Notes: %@ ",[NSString stringWithFormat:@"%@, %@",[activeCustomer lastName], [activeCustomer firstName]],[[activeCustomer activeClaim]customerNumber],[[activeCustomer activeClaim] vinNumber], [[activeCustomer activeClaim] model],[[activeCustomer activeClaim] make], [[activeCustomer activeClaim] vehicleYear],[[activeCustomer activeClaim] vehicleColor], [[activeCustomer activeClaim] licensePlateNumber], [[activeCustomer activeClaim] note]];
    
    //save content to the documents directory
    [content writeToFile:filePath 
              atomically:NO 
                encoding:NSStringEncodingConversionAllowLossy 
                   error:nil];
    
    //NSString *localPath = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
    //NSString *filename = [NSString@"Info.plist";
    NSString *destDir = @"/";
    [[self restClient] uploadFile:fileName toPath:destDir
                    withParentRev:nil fromPath:filePath];
}

- (void)restClient:(DBRestClient*)client uploadedFile:(NSString*)destPath
              from:(NSString*)srcPath metadata:(DBMetadata*)metadata {
    
    NSLog(@"File uploaded successfully to path: %@", metadata.path);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upload Successful!" message:@"Your report has been sent to your Dropbox!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    
}

- (void)restClient:(DBRestClient*)client uploadFileFailedWithError:(NSError*)error {
    NSLog(@"File upload failed with error - %@", error);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upload Failed!" message:@"Something went wrong! Your report has not been uploaded." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

- (DBRestClient *)restClient {
    if (!restClient) {
        restClient =
        [[DBRestClient alloc] initWithSession:[DBSession sharedSession]];
        restClient.delegate = self;
    }
    return restClient;
}


- (IBAction)btnUpdate:(id)sender {
    if ([vinField.text isEqualToString:@""] || [modelField.text isEqualToString:@""]|| [makeField.text isEqualToString:@""] || [yearField.text isEqualToString:@""] || [colorField.text isEqualToString:@""] || [licensePlateField.text isEqualToString:@""] || [noteField.text isEqualToString:@""] ) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Do not leave anything blank" message:@"Please make sure you fully completed the text fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    
    
    CPCCarInfo *tempClaim = [[CPCCarInfo alloc] init];
    [tempClaim setClaimNumber:nil andNote:self.noteField.text andDateCreated:nil andDateExpires:nil andVehicleModel:self.modelField.text andVehicleMake:self.makeField.text andVehicleYear:self.yearField.text andVehicleColor:self.colorField.text andCustomerNumber:nil andLicensePlateNumber:self.licensePlateField.text andVinNumber:self.vinField.text andPicture1:picture1.image andPicture2:picture2.image];
    
    [[[[CPCDataClass sharedInstance] customerInfo] activeClaim ] updateClaimInfo:tempClaim];
}


- (IBAction)btnMail:(id)sender {
    //Erick Centeno Extra credit api mail the report
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    
    //Check if mail instance exist if not create it
    if(mailClass !=nil){
    MFMailComposeViewController *mailComposeViewController=[[MFMailComposeViewController alloc] init];  
     mailComposeViewController.mailComposeDelegate = self;  
    [mailComposeViewController setSubject:[NSString stringWithFormat:@"Claim Report of Customer: %@", [NSString stringWithFormat:@"%@, %@",[activeCustomer lastName], [activeCustomer firstName]]]];
    
    NSString *messageBody=[[NSString alloc] initWithFormat:@" Name: %@ <br /> Customer ID: %@ <br /> Vin#: %@ <br />Model: %@ <br />Make: %@ <br />Year: %@ <br />Color: %@ <br />License Plate #: %@ <br />Notes: %@  <br /><br />Claim Pictures are attached to this email<br />",[NSString stringWithFormat:@"%@, %@",[activeCustomer lastName], [activeCustomer firstName]],[[activeCustomer activeClaim]customerNumber],[[activeCustomer activeClaim] vinNumber], [[activeCustomer activeClaim] model],[[activeCustomer activeClaim] make], [[activeCustomer activeClaim] vehicleYear],[[activeCustomer activeClaim] vehicleColor], [[activeCustomer activeClaim] licensePlateNumber], [[activeCustomer activeClaim] note]];

      //Body of the message
    
      [mailComposeViewController setMessageBody:messageBody isHTML:YES];
    
    // Attach content of images into NSData with claim pictures  
        NSData *imageData = UIImagePNGRepresentation([[activeCustomer activeClaim] picture1]);
        NSData *imageData1= UIImagePNGRepresentation([[activeCustomer activeClaim] picture2]);
     [mailComposeViewController addAttachmentData:imageData mimeType:@"image/png" fileName:@"Picture1"]; 
     [mailComposeViewController addAttachmentData:imageData1 mimeType:@"image/png" fileName:@"Picture2"]; 
    
     //Make sure the evice can place the email. Use hasn't set up an account they need to in order to send mail
      if([mailClass canSendMail])
     [self presentModalViewController:mailComposeViewController animated:YES];  
    }  
}


- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {  
    //Result notify user the status of the email
    
    switch (result) {  
        case MFMailComposeResultCancelled: { 

            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Mail send canceled" message:@"Mail was canceled" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
            break;  
        case MFMailComposeResultSaved:  {
          
            UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Mail saved" message:@"Mail was saved" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert1 show];
        }
            break; 
        
        case MFMailComposeResultSent:  {
           
            UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Mail sent" message:@"Mail was sent" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert2 show]; 
        }
            break;  
        case MFMailComposeResultFailed:  {
            NSString *errorMsg= [NSString stringWithFormat: @"Mail send error: %@.", [error localizedDescription]];  
            UIAlertView *alert3 = [[UIAlertView alloc] initWithTitle:@"Mail errot" message:errorMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert3 show];
        }
            break;  
        default:  
            break;  
    }  
    // Hides the modal view controller  
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
    
    UIImage  *imageTaken;
    UIImage *imageToSave;
    
    imageTaken = (UIImage *) [info objectForKey:
                              UIImagePickerControllerOriginalImage];
    
    imageToSave = [self fixOrientation:imageTaken];
    
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

-(UIImage *) fixOrientation:(UIImage *)theImage
{
    //    if (theImage.imageOrientation == UIImageOrientationUp) return theImage; 
    //    
    //    UIGraphicsBeginImageContextWithOptions(theImage.size, NO, theImage.scale);
    //    [theImage drawInRect:(CGRect){0, 0, theImage.size}];
    //    UIImage *normalizedImage = UIGraphicsGetImageFromCurrentImageContext();
    //    UIGraphicsEndImageContext();
    //    return normalizedImage;
    
    // No-op if the orientation is already correct
    if (theImage.imageOrientation == UIImageOrientationUp) return theImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (theImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, theImage.size.width, theImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, theImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, theImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (theImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, theImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, theImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, theImage.size.width, theImage.size.height,
                                             CGImageGetBitsPerComponent(theImage.CGImage), 0,
                                             CGImageGetColorSpace(theImage.CGImage),
                                             CGImageGetBitmapInfo(theImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (theImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,theImage.size.height,theImage.size.width), theImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,theImage.size.width,theImage.size.height), theImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
    
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
@end
