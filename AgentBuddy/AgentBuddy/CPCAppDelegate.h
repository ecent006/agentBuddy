//
//  CPCAppDelegate.h
//  AgentBuddy
//
//  Created by Lion User on 10/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPCAppDelegate : UIResponder <UIApplicationDelegate>
{
    NSMutableArray *nameArray;
    NSMutableArray *passwordArray;
}
@property (nonatomic, retain) NSMutableArray *nameArray;
@property (nonatomic,retain) NSMutableArray *passwordArray;
@property (strong, nonatomic) UIWindow *window;

-(void) copyDatabaseIfNeeded;
-(NSString *) getDBPath;

@end
