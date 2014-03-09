//
//  PlatformGroup.m
//  CTS
//
//  Created by Chris Vanderschuere on 3/7/14.
//  Copyright (c) 2014 OSU_App_Club. All rights reserved.
//

#import "PlatformGroup.h"

@implementation PlatformGroup

+ (instancetype) platformGroupWithXML:(RXMLElement *)platformGroupXML{
    PlatformGroup *g = [[PlatformGroup alloc] init];
    g.name = [platformGroupXML attribute:@"Name"];
    
    NSArray *xmlPlatforms = [platformGroupXML children:@"Platform"];
    NSMutableArray *platforms = [NSMutableArray arrayWithCapacity:xmlPlatforms.count];
    for (RXMLElement *pX in xmlPlatforms) {
        [platforms addObject:[Platform platformWithXML:pX]];
    }
    
    g.platforms = platforms;
    
    return g;
}

@end
