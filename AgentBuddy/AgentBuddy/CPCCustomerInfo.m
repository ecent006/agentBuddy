//
//  CPCCustomerInfo.m
//  AgentBuddy
//
//  Created by Lion User on 28/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CPCCustomerInfo.h"

@implementation CPCCustomerInfo{
    NSMutableArray *tempArrayC;
    NSMutableArray *tempArrayC1;
    NSMutableArray *tempArrayC2;
    NSMutableArray *tempArrayC3;
    NSMutableArray *tempArrayC4;
    NSMutableArray *tempArrayC5;
    NSMutableArray *tempArrayC6;
    NSMutableArray *tempArrayC7;
    NSMutableArray *tempArrayC8;
    NSMutableArray *tempArrayC9;
    NSMutableArray *tempArrayC10;
}
@synthesize customerNumber, firstName, lastName, houseAddress, city, state, zipCode, email, phoneNumber, birthDate, licenseNumber;
@synthesize customerNumberArray,firstNameArray,lastNameArray,addressArray,cityArray,stateArray,zipCodeArray,emailArray,phoneNumberArray,birthDateArray,licenseNumberArray;

-(id)init
{
    if (self = [super init])
    {
        tempArrayC=[[NSMutableArray alloc] init];
        tempArrayC1=[[NSMutableArray alloc] init];
        tempArrayC2=[[NSMutableArray alloc] init];
        tempArrayC3=[[NSMutableArray alloc] init];
        tempArrayC4=[[NSMutableArray alloc] init];
        tempArrayC5=[[NSMutableArray alloc] init];
        tempArrayC6=[[NSMutableArray alloc] init];
        tempArrayC7=[[NSMutableArray alloc] init];
        tempArrayC8=[[NSMutableArray alloc] init];
        tempArrayC9=[[NSMutableArray alloc] init];
        tempArrayC10=[[NSMutableArray alloc] init];
    }
    return self;
}



-(void) makeDBCopyAsNeeded{
    //Using NSFileManager to perform file system operations.
    NSFileManager *fileManager =[NSFileManager defaultManager];
    NSError *error;
    NSString *dbPath =[self getDBPath];
    BOOL success = [fileManager fileExistsAtPath:dbPath];
    
    if (!success) {
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"MyDatabase.sqlite"];
        success = [fileManager copyItemAtPath:defaultDBPath toPath:dbPath error:&error];
        if(!success)
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
        const char *sql1 = "SELECT fldCustomerNumber, fldFirstName, fldLastName, fldAddress, fldCity, fldState, fldZipCode, fldEmail, fldPhoneNumber, fldBirthDate, fldLicenseNumber FROM tblCustomer order by fldLastName asc";
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
                phoneNumber=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 8)];
                birthDate=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 9)];
                licenseNumber=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 10)];
                
             
               
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
             sqlite3_finalize(selectstmt1);
        }
    }
    else {
       
        
        sqlite3_close(database);
    }



}
-(void) storeCustomerInfo:(NSString *) setCustomerNumber andFirstName:(NSString *)setFirstName andLastName:(NSString *)setLastName andAddress:(NSString *)setAddress andCity:(NSString *)setCity andState:(NSString *)setState andZipCode:(NSString *)setZipCode andEmail:(NSString *)setEmail andPhoneNumber:(NSString *)setPhoneNumber andBirthDate:(NSString *)setBirthDate andLicenseNumber:(NSString *)setLicenseNumber {
    
    [self makeDBCopyAsNeeded];
     sqlite3_stmt *selectstmt;
    
    if (sqlite3_open([[self getDBPath] UTF8String], &database)== SQLITE_OK) {
        
        NSString *insertSQL = [NSString stringWithFormat: 
                               @"INSERT INTO tblCustomer(fldCustomerNumber, fldFirstName, fldLastName, fldAddress, fldCity, fldState, fldZipCode, fldEmail, fldPhoneNumber, fldBirthDate, fldLicenseNumber) VALUES ('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')",[setCustomerNumber UTF8String], [setFirstName UTF8String], [setLastName UTF8String], [setAddress UTF8String], [setCity UTF8String], [setState UTF8String], [setZipCode UTF8String], [setEmail UTF8String], [setPhoneNumber UTF8String], [setBirthDate UTF8String], [setLicenseNumber UTF8String]];
            const char *insert_stmt = [insertSQL UTF8String];
        
        
          
         sqlite3_prepare_v2(database, insert_stmt, -1, &selectstmt, NULL);
        
        if(sqlite3_step(selectstmt)==SQLITE_DONE)
        {
            NSLog(@"insert successfully");
        }
        else
        {
            NSLog(@"insert not successfully");
            
        }
        sqlite3_finalize(selectstmt);
        
    }
    else {
        sqlite3_close(database);
    }
    

    
    
    
}
@end
