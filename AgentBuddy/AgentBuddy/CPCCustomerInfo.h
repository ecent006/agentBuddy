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
    NSString *customerNumber, *firstName, *lastName, *houseAddress, *city, *state, *zipCode, *email, *phoneNumber, *birthDate, *licenseNumber;

    sqlite3 *database;
    
    NSMutableArray *customerNumberArray, *firstNameArray, *lastNameArray, *addressArray, *cityArray, *stateArray, *zipCodeArray, *emailArray, *phoneNumberArray, *birthDateArray, *licenseNumberArray;
   
}

@property (nonatomic,retain)NSString *customerNumber, *firstName, *lastName, *houseAddress, *city, *state, *zipCode, *email, *phoneNumber, *birthDate, *licenseNumber;

@property (nonatomic,retain) NSMutableArray *customerNumberArray, *firstNameArray, *lastNameArray, *addressArray, *cityArray, *stateArray, *zipCodeArray, *emailArray, *phoneNumberArray, *birthDateArray, *licenseNumberArray;

-(void) makeDBCopyAsNeeded;
-(void) getCustomernInfo;
-(void) storeCustomerInfo:(NSString *) setCustomerNumber andFirstName:(NSString *)setFirstName andLastName:(NSString *)setLastName andAddress:(NSString *)setAddress andCity:(NSString *)setCity andState:(NSString *)setState andZipCode:(NSString *)setZipCode andEmail:(NSString *)setEmail andPhoneNumber:(NSString *)setPhoneNumber andBirthDate:(NSString *)setBirthDate andLicenseNumber:(NSString *)setLicenseNumber ;

//-(void) findCustomer: (NSString *)theFirstName andTheLastName:(NSString *)theLastName;


@end
