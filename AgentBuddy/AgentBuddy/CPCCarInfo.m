//
//  CPCCarInfo.m
//  AgentBuddy
//
//  Created by Lion User on 11/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CPCCarInfo.h"

@implementation CPCCarInfo{
    
    NSMutableArray * tempArrayD;
    NSMutableArray * tempArrayD1;
    NSMutableArray * tempArrayD2;
    NSMutableArray * tempArrayD3;
    
}

@synthesize claimNumber, note, dateClaimCreated, dateClaimExpires;
@synthesize customerNumber, licensePlateNumber, make, model, vehicleColor, vehicleYear, vinNumber;
@synthesize claimNumberArray, noteArray, dateClaimCreatedArray, dateClaimExpiresArray;
@synthesize customerNumberArray, licensePlateNumberArray, makeArray, modelArray, vehicleColorArray, vehicleYearArray, vinNumberArray;


-(id)init
{
    if (self = [super init])
    {
        tempArrayD=[[NSMutableArray alloc] init];
        tempArrayD1=[[NSMutableArray alloc] init];
        tempArrayD2=[[NSMutableArray alloc] init];
        tempArrayD3=[[NSMutableArray alloc] init];
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

-(void) getClaimByCustomerNumber:(NSString *)theCustomerNumber
{
    [self makeDBCopyAsNeeded];
    sqlite3_stmt *selectstmt1;
    
    if (sqlite3_open([[self getDBPath] UTF8String], &database)== SQLITE_OK) {
        NSString  *selectSQL = [NSString stringWithFormat:@"SELECT fldClaimNumber, fldNote, fldDateClaimCreate, fldDateClaimExpires FROM tblClaims WHERE fldCustomerNumber = %@",theCustomerNumber];
        NSLog(@"%@", theCustomerNumber);
        
        const char *select_stmt= [selectSQL UTF8String];
        if(sqlite3_prepare_v2(database, select_stmt, -1, &selectstmt1, NULL)==SQLITE_OK){
            
        NSLog(@"HERE2");
                 

            while (sqlite3_step(selectstmt1)==SQLITE_ROW) {
                
                  NSLog(@"HERE2");
                
                claimNumber = [NSString stringWithUTF8String:(char *) sqlite3_column_text(selectstmt1, 0)];
                note=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 1)];
                dateClaimCreated=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 2)];
                dateClaimExpires=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 3)];
                                
                
                
                claimNumberArray=tempArrayD;
                noteArray=tempArrayD1;
                dateClaimCreatedArray=tempArrayD2;
                dateClaimExpiresArray=tempArrayD3;
                               
                
                
                [claimNumberArray addObject:claimNumber];
                [noteArray addObject:note];
                [dateClaimCreatedArray addObject:dateClaimCreated];
                [dateClaimExpiresArray addObject:dateClaimExpires];
               
                //test coming from database
                NSLog(@"%@, %@, %@, %@", claimNumber,note,dateClaimCreatedArray,dateClaimExpires);
            
        }
         sqlite3_finalize(selectstmt1);
        }
    }
    else {
        
        
        sqlite3_close(database);
    }

    
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
