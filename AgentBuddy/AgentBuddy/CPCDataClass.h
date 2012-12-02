//
//  CPCDataClass.h
//  AgentBuddy
//
//  Created by Lion User on 11/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPCCustomerInfo.h"
#import "CPCCarInfo.h"
#import "CPCLogin.h"

@interface CPCDataClass : NSObject
{
    CPCLogin *login;
    CPCCarInfo *carInfo;
    CPCCustomerInfo *customerInfo;
    BOOL addClaimState;
    BOOL editClaimState;
}

@property (retain, nonatomic) CPCLogin *login;
@property (retain, nonatomic) CPCCarInfo *carInfo;
@property (retain, nonatomic) CPCCustomerInfo *customerInfo;
@property (nonatomic) BOOL addClaimState;
@property (nonatomic) BOOL editClaimState;

+ (CPCDataClass *)sharedInstance;

-(CPCLogin*) login;
-(CPCCarInfo*) carInfo;
-(CPCCustomerInfo*) customerInfo;
-(BOOL) addClaimState;
-(void) setAddClaimState:(BOOL)state;
-(BOOL) editClaimState;
-(void) setEditClaimState:(BOOL)state;
-(void) setCurrentClaim:(CPCCarInfo *) claim;

@end
