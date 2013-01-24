RPSTPasswordApp
========
Riposte, an App.net client launched with the cleaver ability to launch 1Password from inside their app.
The code was open sourced by the Riposte Team to allow other apps the ability to quickly do the same.

Usage
========
Check Available Services
--------
Calling the services method will return an NSArray of available services as RPSTPasswordApp objects. 

    #import "RPSTPasswordAppServices.h"
    
    NSArray *passwordServices = [[RPSTPasswordAppServices passwordManagement] services];
    for(RPSTPasswordApp *passwordApp in passwordServices) {
        NSLog(@"%@", passwordApp.name);
    }

Launch Password Service
--------
To launch a RPSTPasswordApp object with a query, just call the launchPasswordAppWithQuery: method.

    #import "RPSTPasswordAppServices.h"  
      
    NSArray *passwordServices = [[RPSTPasswordAppServices passwordManagement] services];  
    if([passwordServices count]) {  
        [[passwordServices objectAtIndex:0] launchPasswordAppWithQuery:@"app.net"];  
    }  
    
TODO
========
- Better method for storing password service information.
    
    
    
