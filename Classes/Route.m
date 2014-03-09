//
//  Route.m
//  CTS
//
//  Created by Chris Vanderschuere on 3/7/14.
//  Copyright (c) 2014 OSU_App_Club. All rights reserved.
//

#import "Route.h"

@implementation Route

+ (instancetype) routeWithXML:(RXMLElement *)routeXML{
    Route *newRoute = [[Route alloc] init];
    
    newRoute.number = [routeXML attribute:@"RouteNo"];
    newRoute.name = [routeXML attribute:@"Name"];
    
    // Create incoming buses
    NSMutableArray *buses = [NSMutableArray array];
    for (RXMLElement *b in [routeXML children:@"Destination"]) {
        [buses addObject:[Bus busWithXML:b]];
    }
    newRoute.incomingBuses = buses;
    
    //Destination Group (Populated with schedule)
    newRoute.group = [DestinationGroup groupWithXML:[routeXML child:@"DestinationGroup"]];
    
    return newRoute;
}

@end
