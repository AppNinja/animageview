//
//  ANCache.h
//  Ninjagram
//
//  Created by Gabriel  on 15/2/13.
//  Copyright (c) 2013 App Ninja. All rights reserved.
//  www.getappninja.com - Your one stop station for mobile app development resources

#import <Foundation/Foundation.h>

@interface ANCache : NSObject

+ (void)clearCache;
+ (void)setObject:(NSData *)data forKey:(NSString *)key;
+ (id)objectForKey:(NSString *)key;

@end
