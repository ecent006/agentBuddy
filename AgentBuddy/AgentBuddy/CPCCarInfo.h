//
//  CPCCarInfo.h
//  AgentBuddy
//
//  Created by Lion User on 11/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface CPCCarInfo : NSObject
{
    
    NSString *claimNumber, *note, *dateClaimCreated, *dateClaimExpires, *vinNumber, *model, *make, *vehicleYear, *vehicleColor, *customerNumber, *licensePlateNumber;
    sqlite3 *database;
    
}

@property (nonatomic,retain) NSString *claimNumber, *note, *dateClaimCreated, *dateClaimExpires, *vinNumber, *model, *make, *vehicleYear, *vehicleColor, *customerNumber, *licensePlateNumber;

-(void) makeDBCopyAsNeeded;
//-(void) getClaimByCustomerNumber:(NSString *)theCustomerNumber;
-(void) setClaimNumber:(NSString *)theClaimNumber andNote:(NSString *) theNote andDateCreated:(NSString *)theDateCreated andDateExpires:(NSString *) theDateExpires andVehicleModel:(NSString *)theVehicleModel andVehicleMake:(NSString *)theVehicleMake andVehicleYear:(NSString *)theVehicleYear andVehicleColor:(NSString *)theVehicleColor andCustomerNumber:(NSString *)theCustomerNumber andLicensePlateNumber:(NSString *)theLincensePlateNumber andVinNumber:(NSString *) theVinNumber;

-(void) storeCarInfo:(NSString *)setVinNumber 
     andVehicleModel:(NSString *)setVehicleModel 
      andVehicleMake:(NSString *)setVehicleMake
      andVehicleYear:(NSString *)setVehicleYear 
     andVehicleColor:(NSString *)setVehicleColor 
   andCustomerNumber:(NSString *)setCustomerNumber 
andLicensePlateNumber:(NSString *)setLincensePlateNumber;

-(void) updateClaimInfo:(CPCCarInfo *) claim;

@end
