//
//  CPCCarInfo.m
//  AgentBuddy
//
//  Created by Lion User on 11/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CPCCarInfo.h"

@implementation CPCCarInfo

@synthesize claimNumber, note, dateClaimCreated, dateClaimExpires, customerNumber, licensePlateNumber, make, model, vehicleColor, vehicleYear, vinNumber;

-(id)init
{
    if (self = [super init])
    {
    
    }
    return self;
}


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

-(void) setClaimNumber:(NSString *)theClaimNumber andNote:(NSString *)theNote andDateCreated:(NSString *)theDateCreated andDateExpires:(NSString *)theDateExpires andVehicleModel:(NSString *)theVehicleModel andVehicleMake:(NSString *)theVehicleMake andVehicleYear:(NSString *)theVehicleYear andVehicleColor:(NSString *)theVehicleColor andCustomerNumber:(NSString *)theCustomerNumber andLicensePlateNumber:(NSString *)theLincensePlateNumber andVinNumber:(NSString *) theVinNumber
{
    claimNumber = theClaimNumber;
    note = theNote;
    dateClaimCreated = theDateCreated;
    dateClaimExpires = theDateExpires;
    model = theVehicleModel;
    make = theVehicleMake;
    vehicleYear = theVehicleYear;
    vehicleColor = theVehicleColor;
    vinNumber = theVinNumber;
    customerNumber = theCustomerNumber;
    licensePlateNumber = theLincensePlateNumber;

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

-(void) updateClaimInfo: (CPCCarInfo *) claim
{
    
    
    [self makeDBCopyAsNeeded];
    sqlite3_stmt *updatestmt1;
    //sqlite3 *database2;
    
    if (sqlite3_open([[self getDBPath] UTF8String], &database)== SQLITE_OK) {
        NSString  *updateSQL = [NSString stringWithFormat:@"UPDATE tblClaims SET fldVinNumber = '%@', fldModel = '%@', fldMake = '%@', fldYear = '%@', fldColor = '%@', fldLicensePlateNumber = '%@', fldNote = '%@' WHERE fldClaimNumber = '%@'",[claim vinNumber] ,[claim model] ,[claim make] ,[claim vehicleYear] ,[claim vehicleColor] ,[claim licensePlateNumber] ,[claim note] , claimNumber];
        NSLog(@"%@", updateSQL);
        
        const char *select_stmt= [updateSQL UTF8String];
        if(sqlite3_prepare_v2(database, select_stmt, -1, &updatestmt1, NULL)==SQLITE_OK){
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Claim Record Updated!" message:@"Your claim has been updated" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
            //NSLog(@"HERE2");
            
            while (sqlite3_step(updatestmt1)==SQLITE_ROW) {
                
            }
            sqlite3_finalize(updatestmt1);
            
        }
    }
    else {
        
        
        sqlite3_close(database);
    }
}

@end
