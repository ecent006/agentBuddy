//
//  CPCCustomerInfo.h
//  AgentBuddy
//
//  Created by Lion User on 28/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface CPCCustomerInfo : NSObject
{
    NSString *customerNumber;
    NSString *firstName;
    NSString *lastName;
    NSString *houseAddress;
    NSString *city;
    NSString *state;
    NSString *zipCode;
    NSString *email;
    NSString *phoneNumber;
    NSString *birthDate;
    NSString *licenseNumber;

    sqlite3 *database;
    
    NSMutableArray *customerNumberArray;
    NSMutableArray *firstNameArray;
    NSMutableArray *lastNameArray;
    NSMutableArray *addressArray;
    NSMutableArray *cityArray;
    NSMutableArray *stateArray;
    NSMutableArray *zipCodeArray;
    NSMutableArray *emailArray;
    NSMutableArray *phoneNumberArray;
    NSMutableArray *birthDateArray;
    NSMutableArray *licenseNumberArray;

    
}

@property (nonatomic,retain)NSString *customerNumber;
@property (nonatomic,retain)NSString *firstName;
@property (nonatomic,retain)NSString *lastName;
@property (nonatomic,retain)NSString *houseAddress;
@property (nonatomic,retain)NSString *city;
@property (nonatomic,retain)NSString *state;
@property (nonatomic,retain)NSString *zipCode; 
@property (nonatomic,retain)NSString *email;
@property (nonatomic,retain) NSString *phoneNumber;
@property (nonatomic,retain)NSString *birthDate;
@property (nonatomic,retain)NSString *licenseNumber;

@property (nonatomic,retain) NSMutableArray *customerNumberArray;
@property (nonatomic,retain) NSMutableArray *firstNameArray;
@property (nonatomic, retain) NSMutableArray *lastNameArray;
@property (nonatomic, retain) NSMutableArray *addressArray;
@property (nonatomic, retain) NSMutableArray *cityArray;
@property (nonatomic, retain) NSMutableArray *stateArray;
@property (nonatomic,retain) NSMutableArray *zipCodeArray;
@property (nonatomic, retain) NSMutableArray *emailArray;
@property (nonatomic, retain) NSMutableArray *phoneNumberArray;
@property (nonatomic,retain) NSMutableArray *birthDateArray;
@property (nonatomic,retain) NSMutableArray *licenseNumberArray;

-(void) makeDBCopyAsNeeded;
-(void) getCustomernInfo;
-(void) storeCustomerInfo:(NSString *) setCustomerNumber andFirstName:(NSString *)setFirstName andLastName:(NSString *)setLastName andAddress:(NSString *)setAddress andCity:(NSString *)setCity andState:(NSString *)setState andZipCode:(NSString *)setZipCode andEmail:(NSString *)setEmail andPhoneNumber:(NSString *)setPhoneNumber andBirthDate:(NSString *)setBirthDate andLicenseNumber:(NSString *)setLicenseNumber ;

//-(void) findCustomer: (NSString *)theFirstName andTheLastName:(NSString *)theLastName;


@end
