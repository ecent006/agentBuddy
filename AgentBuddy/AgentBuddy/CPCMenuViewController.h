//
//  CPCMenuViewController.h
//  AgentBuddy
//
//  Created by Lion User on 12/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPCMenuViewController : UITableViewController <UITableViewDelegate,UITableViewDataSource>{
    
    NSArray *menuList;

}
@property(nonatomic, retain) NSArray *menuList;

@end
