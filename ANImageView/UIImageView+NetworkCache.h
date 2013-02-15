//
//  UIImageView+NetworkCache.h
//  Ninjagram
//
//  Created by Gabriel  on 15/2/13.
//  Copyright (c) 2013 App Ninja. All rights reserved.
//  www.getappninja.com - Your one stop station for mobile app development resources

#import <UIKit/UIKit.h>
#import "ANCache.h"

@interface UIImageView (NetworkCache)

-(void)loadImageFromURL:(NSURL *)url placeholderImage:(UIImage *)placeholder cacheKey:(NSString *)key compression:(float)compressionRatio;

@end
