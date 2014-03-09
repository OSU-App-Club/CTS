//
//  Bus.h
//  CTS
//
//  Created by Chris Vanderschuere on 3/8/14.
//  Copyright (c) 2014 OSU_App_Club. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RaptureXML/RXMLElement.h>


@interface Bus : NSObject

@property (nonatomic, strong) NSString *destination;
@property (nonatomic, strong) NSNumber *eta;

+ (instancetype) busWithXML:(RXMLElement *) busXML;

@end
