//
//  Car.h
//  NSObjectToJSONConverter
//
//  Created by Benjamin Deneux on 20/07/2015.
//  Copyright (c) 2015 Bananapp's. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Wheel.h"

@interface Car : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *brand;

@property (strong, nonatomic) NSArray *wheels;

@property (strong, nonatomic) NSNumber *accident;

@end
