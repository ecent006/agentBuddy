//  PROGRAMMER: Erick Centeno, Jonathan Ciurdar, Ruben Prieto (Group #3)
//  PANTHERID: 3577011, 
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 136
//  ASSIGNMENT:     Semester Project 
//  DUE:            Thursday 12/06/12
//


#import "CPCDataClass.h"

@implementation CPCDataClass

@synthesize customerInfo;
@synthesize login;
@synthesize addClaimState,editClaimState;

+ (CPCDataClass *)sharedInstance
{
    // the instance of this class is stored here
    static CPCDataClass *myInstance = nil;
    
    // check to see if an instance already exists
    if (nil == myInstance) {
        myInstance  = [[[self class] alloc] init];
        
        // initialize variables here
    }
    // return the instance of this class
    return myInstance;
}

-(CPCLogin*) login
{
    if(login == nil)
    {
        login = [[CPCLogin alloc] init];
        
    }
    return login;
}

-(CPCCustomerInfo*) customerInfo
{
    if (customerInfo == nil)
    {
        customerInfo = [[CPCCustomerInfo alloc] init];
    }
    return customerInfo;
}

-(BOOL) addClaimState
{
    return addClaimState;
}

-(void) setAddClaimState:(BOOL)state
{
    addClaimState = state;
}

-(BOOL) editClaimState
{
    return editClaimState;
}

-(void) setEditClaimState:(BOOL)state
{
    editClaimState = state;
}


@end
