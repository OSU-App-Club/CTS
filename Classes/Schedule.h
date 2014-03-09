//
//  Schedule.h
//  CTS
//
//  Created by Chris Vanderschuere on 3/7/14.
//  Copyright (c) 2014 OSU_App_Club. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RaptureXML/RXMLElement.h>
#import "Route.h"

@interface Schedule : NSObject

@property (nonatomic, strong) NSDate *validFrom;
@property (nonatomic, strong) NSArray *routes; // Array of Routes

+ (instancetype) scheduleWithXML:(RXMLElement*) scheduleXML;

@end
