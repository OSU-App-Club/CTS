//
//  PlatformGroup.h
//  CTS
//
//  Created by Chris Vanderschuere on 3/7/14.
//  Copyright (c) 2014 OSU_App_Club. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RaptureXML/RXMLElement.h>

#import "Platform.h"

@interface PlatformGroup : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *platforms; // Array of Platform

+ (instancetype) platformGroupWithXML:(RXMLElement*) platformGroupXML;

@end
