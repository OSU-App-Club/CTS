//
//  DestinationGroup.h
//  CTS
//
//  Created by Chris Vanderschuere on 3/8/14.
//  Copyright (c) 2014 OSU_App_Club. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RaptureXML/RXMLElement.h>


@interface DestinationGroup : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSArray *services; // Array of NSString

+ (instancetype) groupWithXML:(RXMLElement *) groupXML;

@end
