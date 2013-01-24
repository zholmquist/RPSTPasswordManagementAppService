//
//  RPSTPasswordApp.h
//  1Password
//
//  Created by Zach Holmquist on 1/24/13.
//  Copyright (c) 2013 Zach Holmquist. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RPSTPasswordApp : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *queryFormat;
@property (nonatomic, copy) NSURL *urlScheme;

+(RPSTPasswordApp *) passwordAppWithName:(NSString *)aName urlScheme:(NSString *) urlScheme andQueryFormat:(NSString *) queryFormat;
-(void) launchPasswordAppWithQuery:(NSString *)query;

@end
