//
//  Bus.m
//  CTS
//
//  Created by Chris Vanderschuere on 3/8/14.
//  Copyright (c) 2014 OSU_App_Club. All rights reserved.
//

#import "Bus.h"

@implementation Bus

+ (instancetype) busWithXML:(RXMLElement *)busXML{
    Bus *newBus = [[Bus alloc] init];
    newBus.destination = [busXML attribute:@"Name"];
    newBus.eta = @([[[busXML child:@"Trip"] attribute:@"ETA"] integerValue]);
    
    return newBus;
}
@end
