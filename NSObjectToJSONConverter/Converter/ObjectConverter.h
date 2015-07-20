//
//  ObjectConverter.h
//  NSObjectToJSONConverter
//
//  Created by Benjamin Deneux on 20/07/2015.
//  Copyright (c) 2015 Bananapp's. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectConverter : NSObject

+ (NSDictionary *) convertObjectToDictionary:(id)object;

@end
