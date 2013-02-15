//
//  ANCache.m
//  Ninjagram
//
//  Created by Gabriel  on 15/2/13.
//  Copyright (c) 2013 App Ninja. All rights reserved.
//  www.getappninja.com - Your one stop station for mobile app development resources

#import "ANCache.h"

// Caches are stored for 2 weeks before refreshing
#define CACHE_EXPIRY_TIME 1209600

@interface ANCache ()

@property (strong, nonatomic) NSString *fileDirectory;

@end

@implementation ANCache

+ (NSString *)fileDirectory {
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *fileDir = [path objectAtIndex:0];
    NSString *finalFileDir = [fileDir stringByAppendingPathComponent:@"ANCache"];
    return finalFileDir;
}

+ (void)clearCache {
    [[NSFileManager defaultManager] removeItemAtPath:self.fileDirectory error:nil];
}

+ (void)setObject:(NSData *)data forKey:(NSString *)key {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *fileName = [self.fileDirectory stringByAppendingPathComponent:key];
    
    if (![fileManager fileExistsAtPath:self.fileDirectory isDirectory:YES]) {
        [fileManager createDirectoryAtPath:self.fileDirectory withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    NSError *error;
    
    [data writeToFile:fileName options:NSDataWritingAtomic error:&error];
    
    if (error) {
        NSLog(@"Data cannot be written to file. Reason: %@", [error localizedDescription]);
    }
}

+ (id)objectForKey:(NSString *)key {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *fileName = [self.fileDirectory stringByAppendingPathComponent:key];
    
    if ([fileManager fileExistsAtPath:fileName]) {
        // Check for expiry
        NSDate *lastTouchedDate = [[fileManager attributesOfItemAtPath:fileName error:nil] objectForKey:NSFileModificationDate];
        if ([lastTouchedDate timeIntervalSinceNow] > CACHE_EXPIRY_TIME) {
            [fileManager removeItemAtPath:fileName error:nil];
        } else {
            NSData *data = [NSData dataWithContentsOfFile:fileName];
            return data;
        }
    }
    return nil;
}


@end
