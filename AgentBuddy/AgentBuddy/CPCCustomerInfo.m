//
//  CPCCustomerInfo.m
//  AgentBuddy
//
//  Created by Lion User on 28/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CPCCustomerInfo.h"

@implementation CPCCustomerInfo
@synthesize customerNumber, firstName, lastName, houseAddress, city, state, zipCode, email, phoneNumber, birthDate, licenseNumber;
@synthesize customerNumberArray,firstNameArray,lastNameArray,addressArray,cityArray,stateArray,zipCodeArray,emailArray,phoneNumberArray,birthDateArray,licenseNumberArray;


-(void) makeDBCopyAsNeeded{
    //Using NSFileManager to perform file system operations.
    NSFileManager *fileManager =[NSFileManager defaultManager];
    NSError *error;
    NSString *dbPath =[self getDBPath];
    BOOL sucess = [fileManager fileExistsAtPath:dbPath];
    
    if (!sucess) {
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"MyDatabase.sqlite"];
        sucess = [fileManager copyItemAtPath:defaultDBPath toPath:dbPath error:&error];
        if(!sucess)
        {
            NSAssert1(0, @"Failed to create a database to write to '%@'.", [error localizedDescription]);
        }
    }
}
-(NSString *) getDBPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    
    return [documentsDir stringByAppendingPathComponent:@"MyDatabase.sqlite"];
}
-(void) getCustomernInfo{
    [self makeDBCopyAsNeeded];
    
    if (sqlite3_open([[self getDBPath] UTF8String], &database)== SQLITE_OK) {
        const char *sql1 = "SELECT fldCustomerNumber, fldFirstName, fldLastName, fldAddress, fldCity, fldState, fldZipCode, fldEmail, fldPhoneNumber, fldBirthDate, fldLicenseNumber FROM tblCustomer";
        sqlite3_stmt *selectstmt1;
        if(sqlite3_prepare_v2(database, sql1, -1, &selectstmt1, NULL)==SQLITE_OK) {
            
            while (sqlite3_step(selectstmt1)==SQLITE_ROW) {
                
                
                
                customerNumber = [NSString stringWithUTF8String:(char *) sqlite3_column_text(selectstmt1, 0)];
                firstName=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 1)];
                lastName=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 2)];
                houseAddress=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 3)];
                city=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 4)];
                state=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 5)];
                zipCode=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 6)];
                email=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 7)];
                phoneNumber=[NSNumber  numberWithInt:sqlite3_column_int(selectstmt1, 8)] ;
                birthDate=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 9)];
                licenseNumber=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 10)];
                
                NSMutableArray *tempArrayC=[[NSMutableArray alloc] init];
                NSMutableArray *tempArrayC1=[[NSMutableArray alloc] init];
                NSMutableArray *tempArrayC2=[[NSMutableArray alloc] init];
                NSMutableArray *tempArrayC3=[[NSMutableArray alloc] init];
                NSMutableArray *tempArrayC4=[[NSMutableArray alloc] init];
                NSMutableArray *tempArrayC5=[[NSMutableArray alloc] init];
                NSMutableArray *tempArrayC6=[[NSMutableArray alloc] init];
                NSMutableArray *tempArrayC7=[[NSMutableArray alloc] init];
                NSMutableArray *tempArrayC8=[[NSMutableArray alloc] init];
                NSMutableArray *tempArrayC9=[[NSMutableArray alloc] init];
                NSMutableArray *tempArrayC10=[[NSMutableArray alloc] init];
               
                customerNumberArray=tempArrayC;
                firstNameArray=tempArrayC1;
                lastNameArray=tempArrayC2;
                addressArray=tempArrayC3;
                cityArray=tempArrayC4;
                stateArray=tempArrayC5;
                zipCodeArray=tempArrayC6;
                emailArray=tempArrayC7;
                phoneNumberArray=tempArrayC8;
                birthDateArray=tempArrayC9;
                licenseNumberArray=tempArrayC10;


                
                [customerNumberArray addObject:customerNumber];
                [firstNameArray addObject:firstName];
                [lastNameArray addObject:lastName];
                [addressArray addObject:houseAddress];
                [cityArray addObject:city];
                [stateArray addObject:state];
                [zipCodeArray addObject:zipCode];
                [emailArray addObject:email];
                [phoneNumberArray addObject:phoneNumber];
                [birthDateArray addObject:birthDate];
                [licenseNumberArray addObject:licenseNumber];
                
            }
        }
    }
    else {
        sqlite3_close(database);
    }



}
-(void) storeCustomerInfo:(NSString *) setCustomerNumber andFirstName:(NSString *)setFirstName andLastName:(NSString *)setLastName andAddress:(NSString *)setAddress andCity:(NSString *)setCity andState:(NSString *)setState andZipCode:(NSString *)setZipCode andEmail:(NSString *)setEmail andPhoneNumber:(NSNumber *)setPhoneNumber andBirthDate:(NSDate *)setBirthDate andLicenseNumber:(NSString *)setLicenseNumber {
    
    [self makeDBCopyAsNeeded];
    
    
    if (sqlite3_open([[self getDBPath] UTF8String], &database)== SQLITE_OK) {
        
        NSString *insertSQL = [NSString stringWithFormat: 
                               @"INSERT INTO tblCustomer (fldCustomerNumber, fldFirstName, fldLastName, fldAddress, fldCity, fldState, fldZipCode, fldEmail, fldPhoneNumber, fldBirthDate, fldLicenseNumber) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\")",setFirstName, setLastName, setAddress, setCity,setState,setZipCode,setEmail,setPhoneNumber,setBirthDate,setLicenseNumber];
            const char *insert_stmt = [insertSQL UTF8String];
        
        
           sqlite3_stmt *selectstmt;
          if(sqlite3_prepare_v2(database, insert_stmt, -1, &selectstmt, NULL)==SQLITE_OK) {
              NSLog(@"Wrote to database");
         
        }
    }
    else {
        sqlite3_close(database);
    }
    

    
    
    
}
@end
