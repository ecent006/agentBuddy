//
//  CPCEditByCustomer2ViewController.h
//  AgentBuddy
//
//  Created by Lion User on 29/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPCDataClass.h"
@class CPCEditClaimByCustomerViewController;


@interface CPCEditByCustomer2ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
   // NSString *customerNumber;
    CPCEditClaimByCustomerViewController *getCustomerNumber;

}
//@property (nonatomic, retain)NSString * customerNumber;
@property(nonatomic,strong) CPCEditClaimByCustomerViewController *getCustomerNumber;

@end
