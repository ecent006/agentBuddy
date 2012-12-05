//  PROGRAMMER: Erick Centeno, Jonathan Ciurdar, Ruben Prieto (Group #3)
//  PANTHERID: 3577011, 
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 136
//  ASSIGNMENT:     Semester Project 
//  DUE:            Thursday 12/06/12
//


#import <UIKit/UIKit.h>
#import "CPCDataClass.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface CPCClaimReportViewController : UIViewController <UITextFieldDelegate,UITextViewDelegate, MFMailComposeViewControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UITextField *vinField;
@property (strong, nonatomic) IBOutlet UITextField *modelField;
@property (strong, nonatomic) IBOutlet UITextField *makeField;
@property (strong, nonatomic) IBOutlet UITextField *yearField;
@property (strong, nonatomic) IBOutlet UITextField *colorField;
@property (strong, nonatomic) IBOutlet UITextField *licensePlateField;
@property (strong, nonatomic) IBOutlet UITextView *noteField;
@property (strong, nonatomic) IBOutlet UILabel *customerNameField;
@property (weak, nonatomic) IBOutlet UIImageView *picture1;
@property (weak, nonatomic) IBOutlet UIImageView *picture2;
@property (weak, nonatomic) NSData *storePicture1;
@property (weak, nonatomic) NSData *storePicture2;
@property (strong, nonatomic) IBOutlet UILabel *addressField;
@property (strong, nonatomic) IBOutlet UILabel *emailField;
@property (strong, nonatomic) IBOutlet UILabel *phoneField;
@property (strong, nonatomic) IBOutlet UILabel *birthDateField;
@property (strong, nonatomic) IBOutlet UILabel *licenseNumberField;
@property (strong, nonatomic) IBOutlet UILabel *address2Field;


- (IBAction)btnUpdate:(id)sender;
- (IBAction)btnMail:(id)sender;

@end
