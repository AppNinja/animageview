//
//  UIImageView+NetworkCache.m
//  Ninjagram
//
//  Created by Gabriel  on 15/2/13.
//  Copyright (c) 2013 App Ninja. All rights reserved.
//  www.getappninja.com - Your one stop station for mobile app development resources

#import "UIImageView+NetworkCache.h"

@implementation UIImageView (NetworkCache)

-(void)loadImageFromURL:(NSURL *)url placeholderImage:(UIImage *)placeholder cacheKey:(NSString *)key compression:(float)compressionRatio{
    
    self.image = placeholder;
    
    if (!(compressionRatio >= 0.0f && compressionRatio <= 1.0f)) {
        compressionRatio = 0.0f;
    }
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(queue, ^{
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        UIImage *imageLoaded = [UIImage imageWithData:data];
        
        if (imageLoaded) {
            [ANCache setObject:UIImageJPEGRepresentation(imageLoaded, compressionRatio) forKey:key];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.image = imageLoaded;
            });
        }
    });
}

@end
