//
//  CityDetailController.m
//  watch-test
//
//  Created by John Meeker on 11/18/14.
//  Copyright (c) 2014 John Meeker. All rights reserved.
//

#import "CityDetailController.h"
#import "CityRowController.h"

@interface CityDetailController()
@property (strong,nonatomic) NSDictionary *cityLocations;
@end

@implementation CityDetailController

-(id)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self) {
        NSLog(@"init cityDetail with context: %@", context);
        self.cityTitle.text = context;
        
        [self loadCityLocations];
        
        NSDictionary *coords = [self.cityLocations objectForKey:context];
        
        MKCoordinateRegion region;
        region.center.latitude = [[coords objectForKey:@"lat"] doubleValue];
        region.center.longitude = [[coords objectForKey:@"long"] doubleValue];
        region.span.latitudeDelta = .07;
        region.span.longitudeDelta = .07;
        [self.cityMap setCoordinateRegion:region];
    }
    return self;
}


-(void)loadCityLocations {
    self.cityLocations = @{@"Los Angeles" :        @{ @"lat" :  @34.0522222,
                                                      @"long" : @-118.2427778 },
                           @"Atwater Village" :    @{ @"lat" :  @34.116389,
                                                      @"long" : @-118.256389 },
                           @"Los Feliz" :          @{ @"lat" :  @34.1124,
                                                      @"long" : @-118.2851 },
                           @"Highland Park"  :     @{ @"lat" :  @34.11194,
                                                      @"long" : @-118.19806 },
                           @"Silverlake" :         @{ @"lat" :  @34.094444,
                                                      @"long" : @-118.2675 },
                           @"Echo Park" :          @{ @"lat" :  @34.0792,
                                                      @"long" : @-118.258 },
                           @"Koreatown" :          @{ @"lat" :  @34.0618,
                                                      @"long" : @-118.3006 },
                           @"Glendale" :           @{ @"lat" : @34.170833,
                                                      @"long" : @-118.25 }
                           };
}
@end
