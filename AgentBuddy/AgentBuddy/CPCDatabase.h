//
//  CPCDatabase.h
//  AgentBuddy
//
//  Created by Lion User on 17/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@interface CPCDatabase : NSObject 
{
    NSInteger uniqueValue;
    NSString *userName;
    NSString *password;
    
}
@property (nonatomic,readonly) NSInteger uniqueValue;
@property (nonatomic, retain)NSString *userName;
@property (nonatomic,retain) NSString *password;

//class methods
+(void)getInitialDataToDisplay:(NSString *)dbPath;
+(void)finalizeStatements;
//Instance Methods;
-(id)initWithPrimaryKey:(NSString *)pk;


@end
