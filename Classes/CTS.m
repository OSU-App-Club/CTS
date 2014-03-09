//
//  CTS.m
//  CTS
//
//  Created by Chris Vanderschuere on 3/7/14.
//  Copyright (c) 2014 OSU_App_Club. All rights reserved.
//

#import "CTS.h"
#import <AFNetworking/AFNetworking.h>
#import <RaptureXML/RXMLElement.h>

@interface CTS ()
@property (nonatomic, strong) NSString* baseURL;
@property (nonatomic, strong) AFURLSessionManager *sessionManager;

@end

@implementation CTS

+ (instancetype) clientWithBaseURL:(NSString*)baseURL{
    CTS *c = [[CTS alloc] initWithBaseURL:baseURL];
    return  c;
}

#pragma mark - Initialization
- (instancetype) initWithBaseURL:(NSString *)baseURL{
    self = [super init];
    if (self) {
        self.baseURL = baseURL;
        self.sessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
        AFHTTPResponseSerializer *s = [AFHTTPResponseSerializer serializer];
        s.acceptableContentTypes = [NSSet setWithObjects:@"text/xml", nil];
        self.sessionManager.responseSerializer = s;
    }
 
    return self;
}

// Prevent using this init
- (instancetype) init{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"-init is not a valid initializer for the class CTS; use initWithBaseURL instead"
                                 userInfo:nil];
    return nil;
}

#pragma mark - Information

- (void) platformGroupsWithCompletion:(void(^)(NSArray* platformGroups,NSError* error))completion{
    
    NSURLSessionDataTask *task = [self.sessionManager dataTaskWithRequest:[self requestWithMethod:@"PlatformGroup.xml" option:nil] completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            completion(nil,error);
        }
        
        RXMLElement *rootXML = [RXMLElement elementFromXMLData:responseObject];
        
        NSArray *xmlPlatformGroups = [rootXML children:@"PlatformGroup"];
        NSMutableArray *groups = [NSMutableArray arrayWithCapacity:xmlPlatformGroups.count];
        for (RXMLElement *gX in xmlPlatformGroups) {
            [groups addObject:[PlatformGroup platformGroupWithXML:gX]];
        }

        completion(groups,nil);
    }];
    
    [task resume];
}

- (void) platformsWithCompletion:(void(^)(NSArray* platforms,NSError* error))completion{
    
    NSURLSessionDataTask *task = [self.sessionManager dataTaskWithRequest:[self requestWithMethod:@"Platform.xml" option:nil] completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            completion(nil,error);
        }
        
        RXMLElement *rootXML = [RXMLElement elementFromXMLData:responseObject];
        
        NSArray *xmlPlatforms = [rootXML children:@"Platform"];
        NSMutableArray *platforms = [NSMutableArray arrayWithCapacity:xmlPlatforms.count];
        for (RXMLElement *e in xmlPlatforms) {
            [platforms addObject:[Platform platformWithXML:e]];
        }
        
        completion(platforms,nil);
       
    }];
    
    [task resume];
    
}

- (void) etaForPlatform: (Platform *)p completion:(void(^)(NSArray* routes,NSError* error))completion{
    NSURLRequest *req = [self requestWithMethod:@"RoutePositionET.xml" option:@{
                                                                         @"PlatformNo": p.platformNo==nil?@"":p.platformNo,
                                                                         @"PlatformTag":p.platformTag==nil?@"":p.platformTag}
                         ];
    
    NSURLSessionDataTask *task = [self.sessionManager dataTaskWithRequest:req completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            completion(nil,error);
        }
        
        RXMLElement *rootXML = [RXMLElement elementFromXMLData:responseObject];
        Platform *p = [Platform platformWithXML:[rootXML child:@"Platform"]];
        
        completion(p.routes,nil);
    }];
    
    [task resume];

}

- (void) masterScheduleWithCompletion:(void(^)(Project* project,NSError* error))completion{
    NSURLSessionDataTask *task = [self.sessionManager dataTaskWithRequest:[self requestWithMethod:@"ScheduleMaster.xml" option:nil] completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            completion(nil,error);
        }
        
        RXMLElement *rootXML = [RXMLElement elementFromXMLData:responseObject];
        Project *p = [Project projectWithXML:[rootXML child:@"Project"]];
        
        completion(p,nil);
        
    }];
    
    [task resume];
}

#pragma  mark - Utility
- (NSURLRequest *) requestWithMethod:(NSString*) method option:(NSDictionary*) options{
    //Create url with base url
    NSString *urlString = [NSString stringWithFormat:@"%@rtt/public/utility/file.aspx?contenttype=SQLXML&Name=%@",self.baseURL,method];
    
    //Append options
    for (NSString *key in options) {
        urlString = [urlString stringByAppendingString:[NSString stringWithFormat:@"&%@=%@",key,options[key]]];
    }
    
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    
    return req;
}

@end
