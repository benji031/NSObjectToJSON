//
//  ObjectConverter.m
//  NSObjectToJSONConverter
//
//  Created by Benjamin Deneux on 20/07/2015.
//  Copyright (c) 2015 Bananapp's. All rights reserved.
//

#import "ObjectConverter.h"
#import <objc/runtime.h>

@implementation ObjectConverter

+ (NSDictionary *) convertObjectToDictionary:(id)object {

    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList([object class], &count);
    
    for (int i = 0; i < count; i++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        //NSLog(@"KEY = %@", key);
        id value = [object valueForKey:key];
        
        if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
            [dictionary setObject:value forKey:key];
        }
        else if ([value isKindOfClass:[NSArray class]]) {
            NSMutableArray *array = [NSMutableArray new];
            NSArray *values = (NSArray *)value;
            
            for (id array_value in values) {
                [array addObject:[self convertObjectToDictionary:array_value]];
            }
            
            [dictionary setObject:array forKey:key];
        }
        else if ([value isKindOfClass:[NSObject class]]) {
            [dictionary setObject:[self convertObjectToDictionary:value] forKey:key];
        }
        else if (value == nil) {
            [dictionary setObject:[NSNull null] forKey:key];
        }

    }
    
    free(properties);
    
    return dictionary;
}

@end
