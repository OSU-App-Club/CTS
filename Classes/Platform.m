//
//  Platform.m
//  CTS
//
//  Created by Chris Vanderschuere on 3/7/14.
//  Copyright (c) 2014 OSU_App_Club. All rights reserved.
//

#import "Platform.h"

@implementation Platform

+ (instancetype) platformWithXML:(RXMLElement *)platformXML{
    Platform *p = [[Platform alloc] init];
    
    p.name = [platformXML attribute:@"Name"];
    p.platformTag = [platformXML attribute:@"PlatformTag"];
    p.platformNo = [platformXML attribute:@"PlatformNo"];
    p.bearingToRoad = @([[platformXML attribute:@"BearingToRoad"] floatValue]);
    p.roadName = [platformXML attribute:@"RoadName"];
    
    //Postion
    RXMLElement *position = [platformXML child:@"Position"];
    p.position = [[CLLocation alloc] initWithLatitude:[position attribute:@"Lat"].floatValue  longitude:[position attribute:@"Long"].floatValue];

    //Routes (not always populated)
    NSArray *xmlRoutes = [platformXML children:@"Route"];
    NSMutableArray *routes = [NSMutableArray arrayWithCapacity:xmlRoutes.count];
    for (RXMLElement *r in xmlRoutes) {
        [routes addObject:[Route routeWithXML:r]];
    }
    p.routes = routes;
    
    return p;
}

@end
