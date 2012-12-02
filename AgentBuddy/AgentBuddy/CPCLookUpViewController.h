//
//  CPCLookUpViewController.h
//  AgentBuddy
//
//  Created by Lion User on 30/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
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
