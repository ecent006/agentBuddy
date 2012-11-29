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
    NSString *vinNumber;
    NSString *model;
    NSString *make;
    NSString *vehicleYear;
    NSString *vehicleColor;
    NSString *customerNumber;
    NSString *licensePlateNumber;
    
    sqlite3 *database;
    
    NSMutableArray *vinNumberArray;
    NSMutableArray *modelArray;
    NSMutableArray *makeArray;
    NSMutableArray *vehicleYearArray;
    NSMutableArray *vehicleColorArray;
    NSMutableArray *customerNumberArray;
    NSMutableArray *licensePlateNumberArray;
}

@property (nonatomic,retain) NSString *vinNumber;
@property (nonatomic,retain) NSString *model;
@property (nonatomic,retain) NSString *make;
@property (nonatomic,retain) NSString *vehicleYear;
@property (nonatomic,retain) NSString *vehicleColor;
@property (nonatomic,retain) NSString *customerNumber;
@property (nonatomic,retain) NSString *licensePlateNumber;

@property (nonatomic,retain) NSMutableArray *vinNumberArray;
@property (nonatomic,retain) NSMutableArray *modelArray;
@property (nonatomic, retain) NSMutableArray *makeArray;
@property (nonatomic, retain) NSMutableArray *vehicleYearArray;
@property (nonatomic, retain) NSMutableArray *vehicleColorArray;
@property (nonatomic, retain) NSMutableArray *customerNumberArray;
@property (nonatomic,retain) NSMutableArray *licensePlateNumberArray;


-(void) makeDBCopyAsNeeded;
-(void) getCarInfo;
-(void) storeCarInfo:(NSString *)setVinNumber 
     andVehicleModel:(NSString *)setVehicleModel 
      andVehicleMake:(NSString *)setVehicleMake
      andVehicleYear:(NSString *)setVehicleYear 
     andVehicleColor:(NSString *)setVehicleColor 
   andCustomerNumber:(NSString *)setCustomerNumber 
andLicensePlateNumber:(NSString *)setLincensePlateNumber;


@end