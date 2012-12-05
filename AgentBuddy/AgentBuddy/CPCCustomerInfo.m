//  PROGRAMMER: Erick Centeno, Jonathan Ciurdar, Ruben Prieto (Group #3)
//  PANTHERID: 3577011, 
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 136
//  ASSIGNMENT:     Semester Project 
//  DUE:            Thursday 12/06/12
//


#import "CPCCustomerInfo.h"

@implementation CPCCustomerInfo{
    
}
@synthesize customerNumber, firstName, lastName, houseAddress, city, state, zipCode, email, phoneNumber, birthDate, licenseNumber;

@synthesize claimsList;
@synthesize activeClaim;

-(id)init
{
    if (self = [super init])
    {
        claimsList = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) makeDBCopyAsNeeded{
    //Using NSFileManager to perform file system operations.
    NSFileManager *fileManager =[NSFileManager defaultManager];
    NSError *error;
    NSString *dbPath =[self getDBPath];
    BOOL success = [fileManager fileExistsAtPath:dbPath];
    
    if (!success) {
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"MyDatabase.sqlite"];
        success = [fileManager copyItemAtPath:defaultDBPath toPath:dbPath error:&error];
        if(!success)
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

-(void) storeCustomerInfo
{
    
    [self makeDBCopyAsNeeded];
    sqlite3_stmt *selectstmt;
    
    if (sqlite3_open([[self getDBPath] UTF8String], &database)== SQLITE_OK) {
        
        NSString *insertSQL = [NSString stringWithFormat: 
                               @"INSERT INTO tblCustomer(fldCustomerNumber, fldFirstName, fldLastName, fldAddress, fldCity, fldState, fldZipCode, fldEmail, fldPhoneNumber, fldBirthDate, fldLicenseNumber) VALUES ('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')",[customerNumber UTF8String], [firstName UTF8String], [lastName UTF8String], [houseAddress UTF8String], [city UTF8String], [state UTF8String], [zipCode UTF8String], [email UTF8String], [phoneNumber UTF8String], [birthDate UTF8String], [licenseNumber UTF8String]];
        const char *insert_stmt = [insertSQL UTF8String];
        
        
        
        sqlite3_prepare_v2(database, insert_stmt, -1, &selectstmt, NULL);
        
        if(sqlite3_step(selectstmt)==SQLITE_DONE)
        {
            NSLog(@"Record inserted successfully.");
        }
        else
        {
            NSLog(@"Insert not successful!");
            
        }
        sqlite3_finalize(selectstmt);
        
    }
    else {
        sqlite3_close(database);
    }
    
    
    
    
    
}

-(void) setCustomerInfo:(NSString *)setCustomerNumber andFirstName:(NSString *)setFirstName andLastName:(NSString *)setLastName andAddress:(NSString *)setAddress andCity:(NSString *)setCity andState:(NSString *)setState andZipCode:(NSString *)setZipCode andEmail:(NSString *)setEmail andPhoneNumber:(NSString *)setPhoneNumber andBirthDate:(NSString *)setBirthDate andLicenseNumber:(NSString *)setLicenseNumber
{
    customerNumber = setCustomerNumber;
    firstName = setFirstName;
    lastName = setLastName;
    houseAddress = setAddress;
    city = setCity;
    state = setState;
    zipCode = setZipCode;
    email = setEmail;
    phoneNumber = setPhoneNumber;
    birthDate = setBirthDate;
    licenseNumber = setLicenseNumber;
    
}

-(void) setCustomerInfo:(NSString *)setCustomerNumber andFirstName:(NSString *)setFirstName andLastName:(NSString *)setLastName 
{
    customerNumber = setCustomerNumber;
    firstName = setFirstName;
    lastName = setLastName;
    
}

-(BOOL) setCurrentCustomerByCustomerID:(NSString *)custID
{
    if (sqlite3_open([[self getDBPath] UTF8String], &database)== SQLITE_OK) {
        //const char *sql1 = "SELECT fldCustomerNumber, fldFirstName, fldLastName, fldAddress, fldCity, fldState, fldZipCode, fldEmail, fldPhoneNumber, fldBirthDate, fldLicenseNumber FROM tblCustomer WHERE fldCustomer = '%@'";
        NSString *sqlStatement = [NSString stringWithFormat:@"SELECT fldCustomerNumber, fldFirstName, fldLastName, fldAddress, fldCity, fldState, fldZipCode, fldEmail, fldPhoneNumber, fldBirthDate, fldLicenseNumber FROM tblCustomer WHERE fldCustomerNumber = '%@'",custID];
        sqlite3_stmt *selectstmt1;
        if(sqlite3_prepare_v2(database, [sqlStatement UTF8String], -1, &selectstmt1, NULL)==SQLITE_OK) {
            
            while (sqlite3_step(selectstmt1)==SQLITE_ROW) {
                
                
                
                customerNumber = [NSString stringWithUTF8String:(char *) sqlite3_column_text(selectstmt1, 0)];
                firstName=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 1)];
                lastName=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 2)];
                houseAddress=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 3)];
                city=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 4)];
                state=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 5)];
                zipCode=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 6)];
                email=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 7)];
                phoneNumber=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 8)];
                birthDate=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 9)];
                licenseNumber=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 10)];
                
                [self refreshClaimsList];
                
                sqlite3_finalize(selectstmt1);
                return YES;
            }
            sqlite3_finalize(selectstmt1);
        }
        
    }
    
    else {
        
        
        sqlite3_close(database);
    }
    return NO;
}

-(BOOL) setCurrentCustomerByCustomerLastName:(NSString *)ltName
{
    if (sqlite3_open([[self getDBPath] UTF8String], &database)== SQLITE_OK) {
        //const char *sql1 = "SELECT fldCustomerNumber, fldFirstName, fldLastName, fldAddress, fldCity, fldState, fldZipCode, fldEmail, fldPhoneNumber, fldBirthDate, fldLicenseNumber FROM tblCustomer WHERE fldCustomer = '%@'";
        NSString *sqlStatement = [NSString stringWithFormat:@"SELECT fldCustomerNumber, fldFirstName, fldLastName, fldAddress, fldCity, fldState, fldZipCode, fldEmail, fldPhoneNumber, fldBirthDate, fldLicenseNumber FROM tblCustomer WHERE fldLastName = '%@'",ltName];
        sqlite3_stmt *selectstmt1;
        if(sqlite3_prepare_v2(database, [sqlStatement UTF8String], -1, &selectstmt1, NULL)==SQLITE_OK) {
            
            while (sqlite3_step(selectstmt1)==SQLITE_ROW) {
                
                
                
                customerNumber = [NSString stringWithUTF8String:(char *) sqlite3_column_text(selectstmt1, 0)];
                firstName=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 1)];
                lastName=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 2)];
                houseAddress=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 3)];
                city=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 4)];
                state=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 5)];
                zipCode=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 6)];
                email=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 7)];
                phoneNumber=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 8)];
                birthDate=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 9)];
                licenseNumber=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 10)];
                
                [self refreshClaimsList];
                
                sqlite3_finalize(selectstmt1);
                return YES;
            }
            sqlite3_finalize(selectstmt1);
        }
        
    }
    
    else {
        
        
        sqlite3_close(database);
    }
    return NO;
}

-(void) refreshClaimsList
{
    
    [claimsList removeAllObjects];
    
    if(customerNumber)
    {
        [self makeDBCopyAsNeeded];
        sqlite3_stmt *selectstmt1;
        
        if (sqlite3_open([[self getDBPath] UTF8String], &database)== SQLITE_OK) {
            NSString  *selectSQL = [NSString stringWithFormat:@"SELECT fldClaimNumber, fldNote, fldDateClaimCreated, fldDateClaimExpires, fldVinNumber, fldModel, fldMake, fldYear, fldColor, fldLicensePlateNumber, fldPicture1, fldPicture2 FROM tblClaims WHERE fldCustomerNumber = '%@'",customerNumber];
            //NSLog(@"%@", customerNumber);
            
            const char *select_stmt= [selectSQL UTF8String];
            if(sqlite3_prepare_v2(database, select_stmt, -1, &selectstmt1, NULL)==SQLITE_OK){
                
                //NSLog(@"HERE2");
                
                while (sqlite3_step(selectstmt1)==SQLITE_ROW) {
                    
                    //NSLog(@"HERE2");
                    
                    NSString *claimNumber = [NSString stringWithUTF8String:(char *) sqlite3_column_text(selectstmt1, 0)];
                    NSString *note=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 1)];
                    NSString *dateClaimCreated=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 2)];
                    NSString *dateClaimExpires=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 3)];
                    NSString *vinNumber=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 4)];
                    NSString *model=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 5)];
                    NSString *make=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 6)];
                    NSString *year=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 7)];
                    NSString *color=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 8)];
                    NSString *licensePlateNumber=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt1, 9)];
                    NSData *picture1Data = [[NSData alloc] initWithBytes:sqlite3_column_blob(selectstmt1, 10) length:sqlite3_column_bytes(selectstmt1, 10)];
                    UIImage *picture1;
                    if(picture1Data == nil)
                    {
                        picture1 = nil;
                    }
                    else {
                        picture1 = [UIImage imageWithData:picture1Data];
                    }
                    
                    NSData *picture2Data = [[NSData alloc] initWithBytes:sqlite3_column_blob(selectstmt1, 11) length:sqlite3_column_bytes(selectstmt1, 11)];
                    UIImage *picture2;
                    if(picture2Data == nil)
                    {
                        picture2 = nil;
                    }
                    else {
                        picture2 = [UIImage imageWithData:picture2Data];
                    }
                    
                    
                    CPCCarInfo *tempClaim = [[CPCCarInfo alloc] init];
                    [tempClaim setClaimNumber:claimNumber andNote:note andDateCreated:dateClaimCreated andDateExpires:dateClaimExpires andVehicleModel:model andVehicleMake:make andVehicleYear:year andVehicleColor:color andCustomerNumber:customerNumber andLicensePlateNumber:licensePlateNumber andVinNumber:vinNumber andPicture1: picture1 andPicture2:picture2];
                    
                    [claimsList addObject:tempClaim];
                    
                    
                    
                    
                    //test coming from database
                    //NSLog(@"%@, %@, %@, %@", claimNumber,note,dateClaimCreatedArray,dateClaimExpires);
                    
                }
                sqlite3_finalize(selectstmt1);
            }
        }
        else {
            
            
            sqlite3_close(database);
        }
    }
}

-(NSMutableArray *) claimsList
{
    return claimsList;
}

-(void) addClaimToCustomer:(CPCCarInfo *)claim
{
    [self makeDBCopyAsNeeded];
    NSData *image1 = UIImagePNGRepresentation([claim picture1]);
    NSData *image2 = UIImagePNGRepresentation([claim picture2]);
    
    sqlite3_stmt *selectstmt;
    
    if (sqlite3_open([[self getDBPath] UTF8String], &database)== SQLITE_OK) {
        
        NSString *insertSQL = [NSString stringWithFormat: 
                               @"INSERT INTO tblClaims(fldClaimNumber, fldCustomerNumber, fldNote, fldDateClaimCreated, fldDateClaimExpires, fldVinNumber, fldModel, fldMake, fldYear, fldColor, fldLicensePlateNumber, fldPicture1, fldPicture2) VALUES ('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', ?, ?)",[[claim claimNumber] UTF8String], [[claim customerNumber] UTF8String], [[claim note] UTF8String], [[claim dateClaimCreated] UTF8String], [[claim dateClaimExpires] UTF8String], [[claim vinNumber] UTF8String], [[claim model] UTF8String], [[claim make] UTF8String], [[claim  vehicleYear] UTF8String], [[claim vehicleColor] UTF8String], [[claim licensePlateNumber] UTF8String]];
        const char *insert_stmt = [insertSQL UTF8String];
        NSLog(@"%@", insertSQL);
        
        
        sqlite3_prepare_v2(database, insert_stmt, -1, &selectstmt, NULL);
        
        int returnValue1 = -1;
        if(image1 != nil)
        {
            returnValue1 = sqlite3_bind_blob(selectstmt, 1, [image1 bytes], [image1 length], NULL);
        }
        else {
            returnValue1 = sqlite3_bind_blob(selectstmt, 1, nil, -1, NULL);
        }
        
        int returnValue2 = -1;
        if(image2 != nil)
        {
            returnValue2 = sqlite3_bind_blob(selectstmt, 2, [image2 bytes], [image2 length], NULL);
        }
        else {
            returnValue2 = sqlite3_bind_blob(selectstmt, 2, nil, -1, NULL);
        }
        
        if(returnValue1 != SQLITE_OK)
            NSLog(@"Picture 1 not ok!");

        if(returnValue2 != SQLITE_OK)
            NSLog(@"Picture 2 not ok!");
        
        if(sqlite3_step(selectstmt)==SQLITE_DONE)
        {
            NSLog(@"insert successfully");
        }
        else
        {
            NSLog(@"insert not successfully");
            
        }
        sqlite3_finalize(selectstmt);
        
    }
    else {
        sqlite3_close(database);
    }
    
    [self refreshClaimsList];
}

-(void) setCurrentlyActiveClaim:(NSInteger)row
{
    activeClaim = [claimsList objectAtIndex:row];
}

-(BOOL) setCurrentlyActiveClaimByID:(NSString *)theClaimID
{
    for(CPCCarInfo *claim in claimsList)
    {
        NSString *tempClaimID = [claim claimNumber];
        //Pick up here. for some reason the if statement is not executing even though the id's match up
        if([theClaimID isEqualToString: tempClaimID])
        {
            activeClaim = claim;
            return YES;
        }
    }
    return NO;
}

-(BOOL) searchForClaimByID:(NSString *)claimID
{
    [self makeDBCopyAsNeeded];
    sqlite3_stmt *selectstmt1;
    //sqlite3 *database2;
    
    if (sqlite3_open([[self getDBPath] UTF8String], &database)== SQLITE_OK) {
        NSString  *selectSQL = [NSString stringWithFormat:@"SELECT fldCustomerNumber FROM tblClaims WHERE fldClaimNumber = '%@'",claimID];
        //NSLog(@"%@", customerNumber);
        
        const char *select_stmt= [selectSQL UTF8String];
        if(sqlite3_prepare_v2(database, select_stmt, -1, &selectstmt1, NULL)==SQLITE_OK){
            
            //NSLog(@"HERE2");
            
            while (sqlite3_step(selectstmt1)==SQLITE_ROW) {
                
                //NSLog(@"HERE2");
                
                NSString *tempCustNum = [NSString stringWithUTF8String:(char *) sqlite3_column_text(selectstmt1, 0)];
                
                [self setCurrentCustomerByCustomerID:tempCustNum];
                if([self setCurrentlyActiveClaimByID:claimID])
                {
                    sqlite3_finalize(selectstmt1);
                    return YES;
                }
                
                
                
            }
            sqlite3_finalize(selectstmt1);
            
        }
    }
    else {
        
        
        sqlite3_close(database);
    }
    
    return NO;
}

-(void) deleteClaimByClaimID:(NSString *)claimID
{
    [self makeDBCopyAsNeeded];
    sqlite3_stmt *deleteStmt;
    //sqlite3 *database2;
    
    if (sqlite3_open([[self getDBPath] UTF8String], &database)== SQLITE_OK) {
        NSString  *deleteSQL = [NSString stringWithFormat:@"DELETE FROM tblClaims WHERE fldClaimNumber = '%@'",claimID];
        const char *sql = [deleteSQL UTF8String];
        if(sqlite3_prepare_v2(database, sql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error creating delete statement.");
        }
        //NSAssert1(0, @"Error while creating delete statement. '%s'", sqlite3_errmsg(database));
        
        //When binding parameters, index starts from 1 and not zero.
        //sqlite3_bind_int(deleteStmt, 1, coffeeID);
        
        if (SQLITE_DONE != sqlite3_step(deleteStmt))
            NSAssert1(0, @"Error while deleting. '%s'", sqlite3_errmsg(database));
    
        sqlite3_reset(deleteStmt);
    }
    else 
    {
        sqlite3_close(database);
    }
}

@end
