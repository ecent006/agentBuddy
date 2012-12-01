//
//  CPCNewClaimViewController.h
//  AgentBuddy
//
//  Created by Lion User on 12/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
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
