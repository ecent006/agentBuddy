//
//  CPCCustomerInfo.h
//  AgentBuddy
//
//  Created by Lion User on 28/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "CPCCarInfo.h"

@interface CPCCustomerInfo : NSObject
{
    NSString *customerNumber, *firstName, *lastName, *houseAddress, *city, *state, *zipCode, *email, *phoneNumber, *birthDate, *licenseNumber;

    sqlite3 *database;
    NSMutableArray *claimsList;
  
}

@property (nonatomic,retain)NSString *customerNumber, *firstName, *lastName, *houseAddress, *city, *state, *zipCode, *email, *phoneNumber, *birthDate, *licenseNumber;
@property (nonatomic, retain) NSMutableArray *claimsList;

-(void) makeDBCopyAsNeeded;
-(void) storeCustomerInfo:(NSString *) setCustomerNumber andFirstName:(NSString *)setFirstName andLastName:(NSString *)setLastName andAddress:(NSString *)setAddress andCity:(NSString *)setCity andState:(NSString *)setState andZipCode:(NSString *)setZipCode andEmail:(NSString *)setEmail andPhoneNumber:(NSString *)setPhoneNumber andBirthDate:(NSString *)setBirthDate andLicenseNumber:(NSString *)setLicenseNumber ;
-(void) setCustomerNum:(NSString *) theCustomerNumber andFirstName:(NSString *) theFirstName andLastName:(NSString *) theLastName;
-(void) setCurrentCustomerByCustomerID: (NSString *) custID;
-(void) refreshClaimsList;

-(NSMutableArray *) claimsList;

//-(void) findCustomer: (NSString *)theFirstName andTheLastName:(NSString *)theLastName;


@end
