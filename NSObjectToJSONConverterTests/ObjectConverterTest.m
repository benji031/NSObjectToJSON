//
//  ObjectConverterTest.m
//  NSObjectToJSONConverter
//
//  Created by Benjamin Deneux on 20/07/2015.
//  Copyright (c) 2015 Bananapp's. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Car.h"
#import "Wheel.h"
#import "Garage.h"

#import "ObjectConverter.h"

@interface ObjectConverterTest : XCTestCase

@property (strong, nonatomic) Wheel *wheel1;
@property (strong, nonatomic) Wheel *wheel2;
@property (strong, nonatomic) Wheel *wheel3;
@property (strong, nonatomic) Wheel *wheel4;
@property (strong, nonatomic) NSArray *wheels;

@property (strong, nonatomic) Car *car;

@property (strong, nonatomic) Garage *garage;

@end

@implementation ObjectConverterTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _wheel1 = [[Wheel alloc] init];
    self.wheel1.brand = @"Michelin";
    self.wheel1.punctured = true;
    _wheel2 = [[Wheel alloc] init];
    self.wheel2.brand = @"Michelin";
    self.wheel2.punctured = false;
    _wheel3 = [[Wheel alloc] init];
    self.wheel3.brand = @"Michelin";
    self.wheel3.punctured = false;
    _wheel4 = [[Wheel alloc] init];
    self.wheel4.brand = @"Michelin";
    self.wheel4.punctured = false;
    
    _wheels = @[self.wheel1, self.wheel2, self.wheel3, self.wheel4];
    
    _car = [[Car alloc] init];
    self.car.name = @"Navara";
    self.car.brand = @"Nissan";
    self.car.wheels = self.wheels;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBasicClass {
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    [dictionary setObject:self.wheel1.brand forKey:@"brand"];
    [dictionary setObject:[NSNumber numberWithBool:self.wheel1.punctured] forKey:@"punctured"];
    
    XCTAssert([dictionary isEqualToDictionary:[ObjectConverter convertObjectToDictionary:self.wheel1]], @"basic class test pass");
}

- (void)testArraySubClass {
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    [dictionary setObject:self.car.name forKey:@"name"];
    [dictionary setObject:self.car.brand forKey:@"brand"];
    [dictionary setObject:[NSNull null] forKey:@"accident"];
    
    NSMutableDictionary *dictionaryWheel1 = [NSMutableDictionary new];
    [dictionaryWheel1 setObject:self.wheel1.brand forKey:@"brand"];
    [dictionaryWheel1 setObject:[NSNumber numberWithBool:self.wheel1.punctured] forKey:@"punctured"];
    NSMutableDictionary *dictionaryWheel2 = [NSMutableDictionary new];
    [dictionaryWheel2 setObject:self.wheel2.brand forKey:@"brand"];
    [dictionaryWheel2 setObject:[NSNumber numberWithBool:self.wheel2.punctured] forKey:@"punctured"];
    NSMutableDictionary *dictionaryWheel3 = [NSMutableDictionary new];
    [dictionaryWheel3 setObject:self.wheel3.brand forKey:@"brand"];
    [dictionaryWheel3 setObject:[NSNumber numberWithBool:self.wheel3.punctured] forKey:@"punctured"];
    NSMutableDictionary *dictionaryWheel4 = [NSMutableDictionary new];
    [dictionaryWheel4 setObject:self.wheel4.brand forKey:@"brand"];
    [dictionaryWheel4 setObject:[NSNumber numberWithBool:self.wheel4.punctured] forKey:@"punctured"];
    
    [dictionary setObject:@[dictionaryWheel1, dictionaryWheel2, dictionaryWheel3, dictionaryWheel4]forKey:@"wheels"];
    
    XCTAssert([dictionary isEqualToDictionary:[ObjectConverter convertObjectToDictionary:self.car]], @"array subclass test pass");
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        
        Garage *garage = [[Garage alloc] init];
        garage.cars = @[self.car, self.car, @[self.car, @[self.car, @[self.car]]]];
        
        [ObjectConverter convertObjectToDictionary:garage];
    }];
}

@end
