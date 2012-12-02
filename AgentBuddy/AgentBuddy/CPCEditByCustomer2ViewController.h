//
//  CPCEditByCustomer2ViewController.h
//  AgentBuddy
//
//  Created by Lion User on 29/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPCDataClass.h"
#import "CPCClaimReportViewController.h"

@class CPCEditClaimByCustomerViewController;


@interface CPCEditByCustomer2ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *claimsList;
}
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end
