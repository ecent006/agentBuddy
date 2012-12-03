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
    //sqlite3 *database2;
    NSMutableArray *claimsList;
    CPCCarInfo *activeClaim;
  
}

@property (nonatomic,retain)NSString *customerNumber, *firstName, *lastName, *houseAddress, *city, *state, *zipCode, *email, *phoneNumber, *birthDate, *licenseNumber;
@property (nonatomic, retain) NSMutableArray *claimsList;
@property (nonatomic, retain) CPCCarInfo *activeClaim;

-(void) makeDBCopyAsNeeded;

-(void) storeCustomerInfo;
-(void) setCustomerInfo:(NSString *) setCustomerNumber andFirstName:(NSString *)setFirstName andLastName:(NSString *)setLastName andAddress:(NSString *)setAddress andCity:(NSString *)setCity andState:(NSString *)setState andZipCode:(NSString *)setZipCode andEmail:(NSString *)setEmail andPhoneNumber:(NSString *)setPhoneNumber andBirthDate:(NSString *)setBirthDate andLicenseNumber:(NSString *)setLicenseNumber;
-(void) setCustomerInfo:(NSString *) setCustomerNumber andFirstName:(NSString *)setFirstName andLastName:(NSString *)setLastName;
-(BOOL) setCurrentCustomerByCustomerID: (NSString *) custID;
-(void) refreshClaimsList;
-(void) addClaimToCustomer:(CPCCarInfo *) claim;
-(NSMutableArray *) claimsList;
-(void) setCurrentlyActiveClaim:(NSInteger) row;
-(BOOL) setCurrentlyActiveClaimByID:(NSString *) claimID;
-(BOOL) searchForClaimByID:(NSString *) claimID;
-(void) deleteClaimByClaimID:(NSString *) claimID;

//-(void) findCustomer: (NSString *)theFirstName andTheLastName:(NSString *)theLastName;


@end
