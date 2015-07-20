//
//  ViewController.m
//  NSObjectToJSONConverter
//
//  Created by Benjamin Deneux on 20/07/2015.
//  Copyright (c) 2015 Bananapp's. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "Wheel.h"
#import "Garage.h"
#import "ObjectConverter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Wheel *wheel = [[Wheel alloc] init];
    wheel.punctured = false;
    wheel.brand = @"Michelin";
    
    Wheel *wheel2 = [[Wheel alloc] init];
    wheel2.punctured = false;
    wheel2.brand = @"Michelin";
    
    Wheel *wheel3 = [[Wheel alloc] init];
    wheel3.punctured = false;
    wheel3.brand = @"Michelin";
    
    Wheel *wheel4 = [[Wheel alloc] init];
    wheel4.punctured = true;
    wheel4.brand = @"Michelin";

    NSArray *wheels = @[wheel, wheel2, wheel3, wheel4];
    
    Car *car = [[Car alloc] init];
    car.name = @"Navara";
    car.brand = @"Nissan";
    car.wheels = wheels;
    
    NSLog(@"Dictionary : %@", [ObjectConverter convertObjectToDictionary:car]);
    
    
    NSArray *array = @[car, car, car];
    Garage *garage = [[Garage alloc] init];
    garage.cars = array;
    NSLog(@"Dictionary : %@", [ObjectConverter convertObjectToDictionary:garage]);
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
