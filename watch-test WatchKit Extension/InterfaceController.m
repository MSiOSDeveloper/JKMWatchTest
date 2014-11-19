//
//  InterfaceController.m
//  watch-test WatchKit Extension
//
//  Created by John Meeker on 11/18/14.
//  Copyright (c) 2014 John Meeker. All rights reserved.
//

#import "InterfaceController.h"
#import "CityRowController.h"


@interface InterfaceController()
@property (weak,nonatomic) IBOutlet WKInterfaceTable *locationTable;
@property (strong,nonatomic) NSArray *cityNames;
@end


@implementation InterfaceController

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        NSLog(@"%@ initWithContext", self);
        
        [self loadTableData];
    }
    return self;
}

- (void)loadTableData {
    self.cityNames = @[@"Los Angeles", @"Atwater Village", @"Los Feliz", @"Highland Park", @"Silverlake", @"Echo Park", @"Koreatown", @"Glendale"];
    
    [self.locationTable setNumberOfRows:self.cityNames.count withRowType:@"default"];
    
    for (NSInteger i = 0; i < self.cityNames.count; i++) {
        CityRowController *row = [self.locationTable rowControllerAtIndex:i];
        [row.cityLabel setText:[self.cityNames objectAtIndex:i]];
    }
    
}

-(void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    NSString *city = [self.cityNames objectAtIndex:rowIndex];
    NSLog(@"selected %@", city);
//    WKInterfaceController *cityController = [[WKInterfaceController alloc] initWithContext:[self.locationTable rowControllerAtIndex:rowIndex]];
    [self pushControllerWithName:@"cityDetailController" context:[self.cityNames objectAtIndex:rowIndex]];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    NSLog(@"%@ will activate", self);
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    NSLog(@"%@ did deactivate", self);
}

@end



