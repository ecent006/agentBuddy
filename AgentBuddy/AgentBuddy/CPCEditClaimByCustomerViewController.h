//
//  CPCEditClaimByCustomerViewController.h
//  AgentBuddy
//
//  Created by Lion User on 29/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPCDataClass.h"
#import <sqlite3.h>

@interface CPCEditClaimByCustomerViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *customerList;
   sqlite3 *database;
}

-(void) getCustomerInfo;

@end
