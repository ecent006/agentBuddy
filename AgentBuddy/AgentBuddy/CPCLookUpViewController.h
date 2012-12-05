//  PROGRAMMER: Erick Centeno, Jonathan Ciurdar, Ruben Prieto (Group #3)
//  PANTHERID: 3577011, 
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 136
//  ASSIGNMENT:     Semester Project 
//  DUE:            Thursday 12/06/12
//


#import <UIKit/UIKit.h>
#import "CPCDataClass.h"
#import "CPCEditByCustomer2ViewController.h"
#import "CPCClaimReportViewController.h"

@interface CPCLookUpViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *customerID;
@property (weak, nonatomic) IBOutlet UITextField *claimNumber;
- (IBAction)searchLastName:(id)sender;
- (IBAction)searchCustomerID:(id)sender;
- (IBAction)searchClaimNumber:(id)sender;

@end
