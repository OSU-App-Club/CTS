//
//  DestinationGroup.m
//  CTS
//
//  Created by Chris Vanderschuere on 3/8/14.
//  Copyright (c) 2014 OSU_App_Club. All rights reserved.
//

#import "DestinationGroup.h"

@implementation DestinationGroup

+ (instancetype) groupWithXML:(RXMLElement *)groupXML{
    if (groupXML == nil) {
        return nil;
    }
    
    DestinationGroup *group = [[DestinationGroup alloc] init];
    group.name = [groupXML attribute:@"Name"];
    group.identifier = [groupXML attribute:@"ID"];
    
    NSArray *serviceXML = [groupXML children:@"Service"];
    NSMutableArray *services = [NSMutableArray arrayWithCapacity:serviceXML.count];
    for (RXMLElement *s in serviceXML) {
        [services addObject:[s attribute:@"Name"]];
    }
    group.services = services;
    
    return group;
}

@end
