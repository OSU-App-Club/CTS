//
//  CTS.h
//  CTS
//
//  Created by Chris Vanderschuere on 3/7/14.
//  Copyright (c) 2014 OSU_App_Club. All rights reserved.
//

#import <Foundation/Foundation.h>


//
// Custom Types
//

#import "Platform.h"
#import "PlatformGroup.h"
#import "Route.h"
#import "Project.h"


@interface CTS : NSObject <NSXMLParserDelegate>

// Setup
+ (instancetype) clientWithBaseURL:(NSString*)baseURL;
- (instancetype) initWithBaseURL:(NSString*)baseURL;

//
// Information
//
- (void) etaForPlatform: (Platform *)p completion:(void(^)(NSArray* routes,NSError* error))completion;
- (void) masterScheduleWithCompletion:(void(^)(Project* project,NSError* error))completion;
- (void) platformGroupsWithCompletion:(void(^)(NSArray* platformGroups,NSError* error))completion;
- (void) platformsWithCompletion:(void(^)(NSArray* platforms,NSError* error))completion;

@end
