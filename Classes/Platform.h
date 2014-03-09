//
//  Platform.h
//  CTS
//
//  Created by Chris Vanderschuere on 3/7/14.
//  Copyright (c) 2014 OSU_App_Club. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <RaptureXML/RXMLElement.h>
#import "Route.h"

@interface Platform : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSNumber *bearingToRoad;
@property (nonatomic,strong) NSString *roadName;
@property (nonatomic,strong) NSString *platformTag;
@property (nonatomic,strong) NSString *platformNo;
@property (nonatomic,strong) CLLocation *position;

@property (nonatomic,strong) NSArray *routes;

+ (instancetype) platformWithXML:(RXMLElement *) platformXML;

@end
