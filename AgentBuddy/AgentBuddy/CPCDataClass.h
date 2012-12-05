//  PROGRAMMER: Erick Centeno, Jonathan Ciurdar, Ruben Prieto (Group #3)
//  PANTHERID: 3577011, 
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 136
//  ASSIGNMENT:     Semester Project 
//  DUE:            Thursday 12/06/12
//


#import <Foundation/Foundation.h>
#import "CPCCustomerInfo.h"
#import "CPCCarInfo.h"
#import "CPCLogin.h"

@interface CPCDataClass : NSObject
{
    CPCLogin *login;
    CPCCustomerInfo *customerInfo;
    BOOL addClaimState;
    BOOL editClaimState;
}

@property (retain, nonatomic) CPCLogin *login;
@property (retain, nonatomic) CPCCustomerInfo *customerInfo;
@property (nonatomic) BOOL addClaimState;
@property (nonatomic) BOOL editClaimState;

+ (CPCDataClass *)sharedInstance;

-(CPCLogin*) login;
-(CPCCustomerInfo*) customerInfo;
-(BOOL) addClaimState;
-(void) setAddClaimState:(BOOL)state;
-(BOOL) editClaimState;
-(void) setEditClaimState:(BOOL)state;

@end
