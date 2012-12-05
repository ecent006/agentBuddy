//  PROGRAMMER: Erick Centeno, Jonathan Ciurdar, Ruben Prieto (Group #3)
//  PANTHERID: 3577011, 
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 136
//  ASSIGNMENT:     Semester Project 
//  DUE:            Thursday 12/06/12
//


#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface CPCLogin : NSObject
{
    NSString *userName;
    NSString *password;
    sqlite3 *database;
    NSMutableArray *nameArray;
    NSMutableArray *passwordArray;

}
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, retain) NSMutableArray *nameArray;
@property (nonatomic,retain) NSMutableArray *passwordArray;

-(void) makeDBCopyAsNeeded;
-(void) getLogininfo;   
 
@end
