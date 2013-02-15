//
//  NSString+MD5Hash.h
//  Ninjagram
//
//  Created by Gabriel  on 15/2/13.
//  Copyright (c) 2013 App Ninja. All rights reserved.
//  www.getappninja.com - Your one stop station for mobile app development resources
//
//  Reference taken from http://stackoverflow.com/questions/2018550/how-do-i-create-an-md5-hash-of-a-string-in-cocoa

#import <Foundation/Foundation.h>

@interface NSString (MD5Hash)

- (NSString *)MD5String;

@end
