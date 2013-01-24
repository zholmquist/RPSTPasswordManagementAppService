//
//  RPPasswordManagementAppService.m
//  Riposte
//
//  Copyright (c) 2013 Riposte LLC. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
//  PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
//  CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "RPSTPasswordAppServices.h"
#import "RPSTPasswordApp.h"

@implementation RPSTPasswordAppServices

+(RPSTPasswordAppServices *) passwordManagement
{
    RPSTPasswordAppServices *passwordAppService = [[RPSTPasswordAppServices alloc] init];
    passwordAppService.services = [passwordAppService installedPasswordApps];
    return passwordAppService;
}

-(NSArray *) loadAppServices
{
    //# known services.
    NSArray *passwordApps = @[  @{@"name" : @"1Password", @"url":@"onepassword3://", @"format":@"%@%@"},
                                @{@"name" : @"1Password", @"url":@"onepassword4://", @"format":@"%@search/%@"},
                                @{@"name" : @"1Password", @"url":@"onepassword://", @"format":@"%@search/%@"},
                                @{@"name" : @"1Password", @"url":@"onepasswordb://", @"format":@"%@search/%@"}];
    
    //# load into passwordApp objects
    NSMutableArray *appServices = [[NSMutableArray alloc] init];
    for(NSDictionary *app in passwordApps) {
        RPSTPasswordApp *passwordApp = [RPSTPasswordApp passwordAppWithName:[app objectForKey:@"name"]
                                                                  urlScheme:[app objectForKey:@"url"]
                                                             andQueryFormat:[app objectForKey:@"format"]];
        [appServices addObject: passwordApp];
    }
    
    return  appServices;
}

-(NSArray *) installedPasswordApps
{
    NSMutableArray *installedApps = [[NSMutableArray alloc] init];
    for(RPSTPasswordApp *passwordApp in [self loadAppServices]) {
        if([[UIApplication sharedApplication] canOpenURL:passwordApp.urlScheme]) {
            [installedApps addObject: passwordApp];
        }
    }
    
    return installedApps;
}

@end