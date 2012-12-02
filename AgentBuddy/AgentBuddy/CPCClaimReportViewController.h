//
//  CPCClaimReportViewController.h
//  AgentBuddy
//
//  Created by Lion User on 12/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPCDataClass.h"

@interface CPCClaimReportViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *vinField;
@property (strong, nonatomic) IBOutlet UITextField *modelField;
@property (strong, nonatomic) IBOutlet UITextField *makeField;
@property (strong, nonatomic) IBOutlet UITextField *yearField;
@property (strong, nonatomic) IBOutlet UITextField *colorField;
@property (strong, nonatomic) IBOutlet UITextField *licensePlateField;
@property (strong, nonatomic) IBOutlet UITextView *noteField;
@property (strong, nonatomic) IBOutlet UILabel *customerNameField;
- (IBAction)btnUpdate:(id)sender;

@end
