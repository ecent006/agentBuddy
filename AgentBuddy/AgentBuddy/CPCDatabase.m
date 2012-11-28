//
//  CPCDatabase.m
//  AgentBuddy
//
//  Created by Lion User on 17/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CPCDatabase.h"
//#import "CPCAppDelegate.h"
//
//static sqlite3 *database =nil;
//
@implementation CPCDatabase
//@synthesize uniqueValue;
//@synthesize userName;
//@synthesize password;
//
//@synthesize customerNumber, firstName, lastName, houseAddress, city, state, zipCode, email, phoneNumber, birthDate, licenseNumber;


//Class methods
//+(void)getInitialDataToDisplay:(NSString *)dbPath
//{
//    CPCAppDelegate *appDelegate= (CPCAppDelegate *) [[UIApplication sharedApplication] delegate];
//    if (sqlite3_open([dbPath UTF8String], &database)== SQLITE_OK) {
//        const char *sql = "SELECT fldLUser, fldLPassword FROM tblLogin";
//        sqlite3_stmt *selectstmt;
//        if(sqlite3_prepare_v2(database, sql, -1, &selectstmt, NULL)==SQLITE_OK) {
//            
//            while (sqlite3_step(selectstmt)==SQLITE_ROW) {
//                NSString *primaryKey = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(selectstmt, 0)];
//                //address.text = addressField;
//                CPCDatabase *listObj = [[CPCDatabase alloc] initWithPrimaryKey:primaryKey];
//                listObj.password=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 1)];
//                
//                [appDelegate.nameArray addObject:primaryKey];
//                [appDelegate.passwordArray addObject:listObj.password];
//                
//                
//            }
//        }
//        
//        
//    }
//    else {
//        sqlite3_close(database);
//    }
//    
    
//}

//+(void)getCustomerDataToDisplay:(NSString *)dbPath{
    
//    CPCAppDelegate *appDelegate= (CPCAppDelegate *) [[UIApplication sharedApplication] delegate];
//    if (sqlite3_open([dbPath UTF8String], &database)== SQLITE_OK) {
//
//    const char *sql1 = "SELECT fldCustomerNumber, fldFirstName, fldLastName, fldAddress, fldCity, fldState, fldZipCode, fldEmail, fldPhoneNumber, fldBirthDate, fldLicenseNumber FROM tblCustomer";
//    sqlite3_stmt *selectstmt1;
//    if(sqlite3_prepare_v2(database, sql1, -1, &selectstmt1, NULL)==SQLITE_OK) {
//        
//        while (sqlite3_step(selectstmt1)==SQLITE_ROW) {
//            
//            
//            CPCDatabase *listObj = [[CPCDatabase alloc] initWithPrimaryKey:listObj.userName];
//            listObj.customerNumber = [NSString stringWithUTF8String:(char *) sqlite3_column_text(selectstmt1, 0)];
//            listObj.firstName=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 1)];
//            listObj.lastName=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 2)];
//            listObj.houseAddress=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 3)];
//            listObj.city=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 4)];
//            listObj.state=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 5)];
//            listObj.zipCode=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 6)];
//            listObj.email=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 7)];
//            listObj.phoneNumber=[NSNumber  numberWithInt:sqlite3_column_int(selectstmt1, 8)] ;
//            listObj.birthDate=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 9)];
//            listObj.licenseNumber=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 10)];
//            
//            [appDelegate.customerNumberArray addObject:listObj.customerNumber];
//            [appDelegate.firstNameArray addObject:listObj.firstName];
//            [appDelegate.lastNameArray addObject:listObj.lastName];
//            [appDelegate.addressArray addObject:listObj.houseAddress];
//            [appDelegate.cityArray addObject:listObj.city];
//            [appDelegate.stateArray addObject:listObj.state];
//            [appDelegate.zipCodeArray addObject:listObj.zipCode];
//            [appDelegate.emailArray addObject:listObj.email];
//            [appDelegate.phoneNumberArray addObject:listObj.phoneNumber];
//            [appDelegate.birthDateArray addObject:listObj.birthDate];
//            [appDelegate.licenseNumber addObject:listObj.licenseNumber];
//            
//        }
//    }
//}
    
//}

//-(id)initWithPrimaryKey:(NSString *)pk{
//    
//    if ((self = [super init])) {
//    userName = pk;
//    
//    }
//    return self;
//}

//+(void)finalizeStatements {
//    if(database) 
 //       sqlite3_close(database);
//}
@end
