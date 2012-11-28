//
//  CPCLogin.h
//  AgentBuddy
//
//  Created by Lion User on 16/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface CPCLogin : NSObject
{
    NSString *userName;
    NSString *password;
    sqlite3 *database;
    NSMutableArray *nameArray;
    NSMutableArray *passwordArray;

}
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, retain) NSMutableArray *nameArray;
@property (nonatomic,retain) NSMutableArray *passwordArray;

-(void) makeDBCopyAsNeeded;
-(void) getLogininfo;   
 
@end
