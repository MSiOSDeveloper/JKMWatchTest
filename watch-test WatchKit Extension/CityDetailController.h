//
//  CityDetailController.h
//  watch-test
//
//  Created by John Meeker on 11/18/14.
//  Copyright (c) 2014 John Meeker. All rights reserved.
//

#import <WatchKit/WatchKit.h>

@interface CityDetailController : WKInterfaceController

@property (nonatomic,weak) IBOutlet WKInterfaceLabel *cityTitle;
@property (nonatomic,weak) IBOutlet WKInterfaceMap *cityMap;

@end
