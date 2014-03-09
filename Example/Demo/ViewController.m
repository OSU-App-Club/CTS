//
//  ViewController.m
//  Demo
//
//  Created by Chris Vanderschuere on 3/8/14.
//  Copyright (c) 2014 OSU-App-Club. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CTS *client = [CTS clientWithBaseURL:@"http://www.corvallistransit.com/"];
    [client platformsWithCompletion:^(NSArray *platforms, NSError *error) {
        for (Platform *p in platforms) {
            NSLog(@"Platform: %@",p.name);
        }
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
