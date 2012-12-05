//  PROGRAMMER: Erick Centeno, Jonathan Ciurdar, Ruben Prieto (Group #3)
//  PANTHERID: 3577011, 
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 136
//  ASSIGNMENT:     Semester Project 
//  DUE:            Thursday 12/06/12
//


#import <UIKit/UIKit.h>
#import "CPCDataClass.h"

@interface CPCNewClaimViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic,retain) NSString  *customerNumber;
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *state;
@property (weak, nonatomic) IBOutlet UITextField *zipCode;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *birthDate;
@property (weak, nonatomic) IBOutlet UITextField *licenseNumber;

- (IBAction)btnContinue:(id)sender;
- (IBAction)showCalendar:(id)sender;
@end
