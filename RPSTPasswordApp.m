//
//  RPSTPasswordApp.m
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
