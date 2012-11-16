//
//  CPCLogin.h
//  AgentBuddy
//
//  Created by Lion User on 16/11/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPCLogin : NSObject
{
    NSString *_user;
    NSString *_password;
}
@property (nonatomic, copy) NSString *user;
@property (nonatomic, copy) NSString *password;

- (id)initWithUser:(NSString *)user password:(NSString *)password;

@end
