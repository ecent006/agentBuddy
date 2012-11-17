//
//  CPCDatabase.m
//  AgentBuddy
//
//  Created by Lion User on 17/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CPCDatabase.h"
#import "CPCAppDelegate.h"

static sqlite3 *database =nil;

@implementation CPCDatabase
@synthesize uniqueValue;
@synthesize userName;
@synthesize password;


//Class methods
+(void)getInitialDataToDisplay:(NSString *)dbPath
{
    CPCAppDelegate *appDelegate= (CPCAppDelegate *) [[UIApplication sharedApplication] delegate];
    if (sqlite3_open([dbPath UTF8String], &database)== SQLITE_OK) {
        const char *sql = "SELECT fldLUser, fldLPassword FROM tblLogin";
        sqlite3_stmt *selectstmt;
        if(sqlite3_prepare_v2(database, sql, -1, &selectstmt, NULL)==SQLITE_OK) {
            
            while (sqlite3_step(selectstmt)==SQLITE_ROW) {
                NSString *primaryKey = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(selectstmt, 0)];
                //address.text = addressField;
                CPCDatabase *listObj = [[CPCDatabase alloc] initWithPrimaryKey:primaryKey];
                listObj.password=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 1)];
                
                [appDelegate.nameArray addObject:primaryKey];
                [appDelegate.passwordArray addObject:listObj.password];
            }
        }
    }
    else {
        sqlite3_close(database);
    }
}

-(id)initWithPrimaryKey:(NSString *)pk{
    
    if ((self = [super init])) {
    userName = pk;
    
    }
    return self;
}

+(void)finalizeStatements {
    if(database) 
        sqlite3_close(database);
}
@end
