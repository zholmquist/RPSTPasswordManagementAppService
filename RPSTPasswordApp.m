//
//  RPSTPasswordApp.m
//  1Password
//
//  Created by Zach Holmquist on 1/24/13.
//  Copyright (c) 2013 Zach Holmquist. All rights reserved.
//

#import "RPSTPasswordApp.h"

@implementation RPSTPasswordApp
+(RPSTPasswordApp *) passwordAppWithName:(NSString *)aName urlScheme:(NSString *) urlScheme andQueryFormat:(NSString *) queryFormat
{
    RPSTPasswordApp *passwordApp = [[RPSTPasswordApp alloc] init];
    passwordApp.name = aName;
    passwordApp.urlScheme = [NSURL URLWithString:urlScheme];
    passwordApp.queryFormat = queryFormat;

    return passwordApp;
}

-(void) launchPasswordAppWithQuery:(NSString *)query
{
    if([[UIApplication sharedApplication] canOpenURL:self.urlScheme])
    {
        NSString *appSchemeQuery = [NSString stringWithFormat:self.queryFormat, [self.urlScheme absoluteString], query];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appSchemeQuery]];
    }
}
@end
