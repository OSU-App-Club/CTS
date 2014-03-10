# cts

[![Version](http://cocoapod-badges.herokuapp.com/v/CTS/badge.png)](http://cocoadocs.org/docsets/cts)
[![Platform](http://cocoapod-badges.herokuapp.com/p/CTS/badge.png)](http://cocoadocs.org/docsets/cts)

## Usage

The Corvallis Transit System is based on a Connexionz system to provide schedule, route, platform, and eta information. This library creates a wrapper around the Connexionz system to make it much easier to work with.


### Platforms
If you want to get a list of all of the platforms on the Corvallis Transit System (CTS)

```objective-c
Client *cts = [[CTS alloc] initWithBaseURL:@"http://www.corvallistransit.com/"];

[cts platformsWithCompletion:^(NSArray *platforms, NSError *error) {
    for(Platform *p in platforms){
        NSLog(@"%@: (%f,%f)",p.name,p.position.coordinate.latitude,p.position.coordinate.longitude);
    }
}];

```

### ETA

If you want to see the expected time of arrival for buses to a particular platform

```objective-c
Client *cts = [[CTS alloc] initWithBaseURL:@"http://www.corvallistransit.com/"];

[cts platformsWithCompletion:^(NSArray *platforms, NSError *error) {
    for (Platform *p in platforms) {
        [self.client etaForPlatform:p completion:^(NSArray *routes, NSError *error) {
            for(Route *r in routes){
                NSLog(@"Route:%@",r);
            }
        }];
    }
}];

```


## Requirements

## Installation

CTS is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "CTS"
    
    
__If you are new to CocoaPods, here is a good [guide](http://guides.cocoapods.org/using/using-cocoapods.html)__     

## Author

cvanderschuere, cdvconcepts@gmail.com

## License

CTS is available under the MIT license. See the LICENSE file for more info.

