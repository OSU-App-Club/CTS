//
//  Route.h
//  CTS
//
//  Created by Chris Vanderschuere on 3/7/14.
//  Copyright (c) 2014 OSU_App_Club. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RaptureXML/RXMLElement.h>
#import "DestinationGroup.h"
#import "Bus.h"

@interface Route : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *number;
@property (nonatomic, strong) DestinationGroup *group;

@property (nonatomic, strong) NSArray *incomingBuses; //Array of (Bus *)

+ (instancetype) routeWithXML:(RXMLElement*) routeXML;

@end
