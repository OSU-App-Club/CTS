//
//  Project.h
//  CTS
//
//  Created by Chris Vanderschuere on 3/7/14.
//  Copyright (c) 2014 OSU_App_Club. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RaptureXML/RXMLElement.h>
#import "Schedule.h"

@interface Project : NSObject

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) Schedule *schedule; // Array of Schedules

+ (instancetype) projectWithXML:(RXMLElement*) projectXML;

@end
