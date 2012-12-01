//
//  CPCNewClaimViewController2.h
//  AgentBuddy
//
//  Created by Lion User on 29/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPCDataClass.h"

@interface CPCNewClaimViewController2 :  UIViewController <UITextFieldDelegate, UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *vinNumber;
@property (weak, nonatomic) IBOutlet UITextField *model;
@property (weak, nonatomic) IBOutlet UITextField *make;
@property (weak, nonatomic) IBOutlet UITextField *year;
@property (weak, nonatomic) IBOutlet UITextField *color;
@property (weak, nonatomic) IBOutlet UITextField *licensePlateNumber;
@property (weak, nonatomic) IBOutlet UITextView *claimNotes;
@property (weak, nonatomic) IBOutlet UIImageView *picture1;
@property (weak, nonatomic) IBOutlet UIImageView *picture2;
@property (strong, nonatomic) IBOutlet UILabel *customerLabel;
- (IBAction)addClaimBtn:(UIButton *)sender;

//-(IBAction)showCamera1:(id)sender;
//-(IBAction)showCamera2:(id)sender;
@end
