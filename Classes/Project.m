//
//  Project.m
//  CTS
//
//  Created by Chris Vanderschuere on 3/7/14.
//  Copyright (c) 2014 OSU_App_Club. All rights reserved.
//

#import "Project.h"

@implementation Project

+ (instancetype) projectWithXML:(RXMLElement *)projectXML{
    Project *p = [[Project alloc] init];
    
    p.name = [projectXML attribute:@"Name"];
    p.identifier = [projectXML attribute:@"ProjectID"];
    
    //Schedule  
    p.schedule = [Schedule scheduleWithXML:[projectXML child:@"Schedule"]];
    
    return p;
}

@end
