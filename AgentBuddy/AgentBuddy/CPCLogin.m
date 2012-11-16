//
//  CPCLogin.m
//  AgentBuddy
//
//  Created by Lion User on 16/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CPCLogin.h"

@implementation CPCLogin

@synthesize user=_user;
@synthesize password=_password;
-(id)initWithUser:(NSString *)user password:(NSString *)password{
    if ((self = [super init])) {
        self.user = user;
        self.password = password;
    
    }
    return self;  
}
@end
