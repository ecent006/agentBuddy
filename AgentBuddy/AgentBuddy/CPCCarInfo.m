//
//  CPCCarInfo.m
//  AgentBuddy
//
//  Created by Lion User on 11/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CPCCarInfo.h"

@implementation CPCCarInfo

@synthesize claimNumber, note, dateClaimCreated, dateClaimExpires;
@synthesize customerNumber, licensePlateNumber, make, model, vehicleColor, vehicleYear, vinNumber;
@synthesize claimNumberArray, noteArray, dateClaimCreatedArray, dateClaimExpiresArray;
@synthesize customerNumberArray, licensePlateNumberArray, makeArray, modelArray, vehicleColorArray, vehicleYearArray, vinNumberArray;


-(void) makeDBCopyAsNeeded
{
    
}

-(void) getCarInfo
{
    
}

-(void) storeCarInfo:(NSString *)setVinNumber 
     andVehicleModel:(NSString *)setVehicleModel 
      andVehicleMake:(NSString *)setVehicleMake
      andVehicleYear:(NSString *)setVehicleYear 
     andVehicleColor:(NSString *)setVehicleColor 
   andCustomerNumber:(NSString *)setCustomerNumber 
andLicensePlateNumber:(NSString *)setLincensePlateNumber
{
    
}


@end
