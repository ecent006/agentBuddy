//  PROGRAMMER: Erick Centeno, Jonathan Ciurdar, Ruben Prieto (Group #3)
//  PANTHERID: 3577011, 
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 136
//  ASSIGNMENT:     Semester Project 
//  DUE:            Thursday 12/06/12
//


#import "CPCLogin.h"

@implementation CPCLogin{
    NSMutableArray *tempArray;
    NSMutableArray *tempArray2;
    
}

@synthesize userName=_userName;
@synthesize password=_password;
@synthesize nameArray;
@synthesize passwordArray;


-(id)init
{
    if (self = [super init])
    {
     tempArray= [[NSMutableArray alloc] init];
     tempArray2= [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)makeDBCopyAsNeeded{
    //Using NSFileManager to perform file system operations.
    NSFileManager *fileManager =[NSFileManager defaultManager];
    NSError *error;
    NSString *dbPath =[self getDBPath];
    //[fileManager removeItemAtPath:dbPath error:nil];
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

-(void) getLogininfo {
    
    [self makeDBCopyAsNeeded];
    if (sqlite3_open([[self getDBPath] UTF8String], &database)== SQLITE_OK) {
        const char *sql = "SELECT fldLUser, fldLPassword FROM tblLogin";
        sqlite3_stmt *selectstmt;
        if(sqlite3_prepare_v2(database, sql, -1, &selectstmt, NULL)==SQLITE_OK) {
            
            while (sqlite3_step(selectstmt)==SQLITE_ROW) {
                NSString *primaryKey = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(selectstmt, 0)];
                
                
                password=[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 1)];
                
               
                nameArray=tempArray;
                passwordArray=tempArray2;
                
                [nameArray addObject:primaryKey];
                [passwordArray addObject:password];
                
            }
        }
        
        
    }
    else {
        sqlite3_close(database);
    }
    
}
@end
