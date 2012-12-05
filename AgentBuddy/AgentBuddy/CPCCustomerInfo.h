//  PROGRAMMER: Erick Centeno, Jonathan Ciurdar, Ruben Prieto (Group #3)
//  PANTHERID: 3577011, 
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 136
//  ASSIGNMENT:     Semester Project 
//  DUE:            Thursday 12/06/12
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
-(BOOL) setCurrentCustomerByCustomerLastName:(NSString *)ltName;
-(void) refreshClaimsList;
-(void) addClaimToCustomer:(CPCCarInfo *) claim;
-(NSMutableArray *) claimsList;
-(void) setCurrentlyActiveClaim:(NSInteger) row;
-(BOOL) setCurrentlyActiveClaimByID:(NSString *) claimID;
-(BOOL) searchForClaimByID:(NSString *) claimID;
-(void) deleteClaimByClaimID:(NSString *) claimID;

//-(void) findCustomer: (NSString *)theFirstName andTheLastName:(NSString *)theLastName;


@end
