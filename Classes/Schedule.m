//
//  Schedule.m
//  CTS
//
//  Created by Chris Vanderschuere on 3/7/14.
//  Copyright (c) 2014 OSU_App_Club. All rights reserved.
//

#import "Schedule.h"

@implementation Schedule

+ (instancetype) scheduleWithXML:(RXMLElement *)scheduleXML{
    Schedule *s = [[Schedule alloc] init];
    
    NSString *dateString = [scheduleXML attribute:@"ValidFrom"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    s.validFrom = [dateFormatter dateFromString:dateString];
    
    NSArray *routeXMLS = [scheduleXML children:@"Route"];
    NSMutableArray *routes = [NSMutableArray arrayWithCapacity:routeXMLS.count];
    for (RXMLElement *r in routeXMLS) {
        [routes addObject:[Route routeWithXML:r]];
    }
    s.routes = routes;
    
    return s;
}

@end
