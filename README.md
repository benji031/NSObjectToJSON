# NSObjectToJSON
Convert Classic NSObject to NSDictionary / JSON in Objective-c

## Exemple

```objective-c
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
    
    //NSLog(@"Dictionary : %@", [ObjectConverter convertObjectToDictionary:car]);

    NSArray *array = @[car, car, car];
    Garage *garage = [[Garage alloc] init];
    garage.cars = array;
    //NSLog(@"Dictionary : %@", [ObjectConverter convertObjectToDictionary:garage]);
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[ObjectConverter convertObjectToDictionary:garage] options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"JSON format : %@", jsonString);
```

Return : 

```
2015-07-20 12:04:26.241 NSObjectToJSONConverter[7380:460267] JSON format : {
  "cars" : [
    {
      "brand" : "Nissan",
      "wheels" : [
        {
          "brand" : "Michelin",
          "punctured" : false
        },
        {
          "brand" : "Michelin",
          "punctured" : false
        },
        {
          "brand" : "Michelin",
          "punctured" : false
        },
        {
          "brand" : "Michelin",
          "punctured" : true
        }
      ],
      "name" : "Navara",
      "accident" : null
    },
    {
      "brand" : "Nissan",
      "wheels" : [
        {
          "brand" : "Michelin",
          "punctured" : false
        },
        {
          "brand" : "Michelin",
          "punctured" : false
        },
        {
          "brand" : "Michelin",
          "punctured" : false
        },
        {
          "brand" : "Michelin",
          "punctured" : true
        }
      ],
      "name" : "Navara",
      "accident" : null
    },
    {
      "brand" : "Nissan",
      "wheels" : [
        {
          "brand" : "Michelin",
          "punctured" : false
        },
        {
          "brand" : "Michelin",
          "punctured" : false
        },
        {
          "brand" : "Michelin",
          "punctured" : false
        },
        {
          "brand" : "Michelin",
          "punctured" : true
        }
      ],
      "name" : "Navara",
      "accident" : null
    }
  ]
}
```
