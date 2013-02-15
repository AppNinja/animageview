Visit http://getappninja.com - your one stop station for mobile app development resources. 

ANImageView
===========

An UIImageView that loads images from the web asynchronously and caches them for you to retrieve at will after the first download. This is a lightweight library for working with remote images.

NSString+MD5Hash.h is referenced from Stack Overflow at http://stackoverflow.com/questions/2018550/how-do-i-create-an-md5-hash-of-a-string-in-cocoa

How To Use
==========

###Using UIImageView+NetworkCache.h in your app
Just #import the UIImageView+NetworkCache.h header, NSString+MD5Hash.h header and ANCache.h header into your project. The files are split up in case you just want to leverage the caching of ANCache.h, which can also used to store videos, audio files or images in the app's file directory.

```objective-c

#import UIImageView+NetworkCache.h
#import NSString+MD5Hash.h
#import ANCache.h
...

- (void)viewDidLoad
{
    [super viewDidLoad]; 

    NSString *urlString = @"http://www.domain.com/image.jpg";
    NSString *md5String = [urlString MD5String];
    NSData *data = [ANCache objectForKey:md5String];

    if (data) {
        NSLog(@"Data available. Loading from cache immediately.");
        UIImage *image = [UIImage imageWithData:data];
        _photoImageView.image = image;
    } else {
        NSLog(@"Data not available.. creating and saving to file directory.");
            [_photoImageView loadImageFromURL:[NSURL URLWithString:urlString] 
                             placeholderImage:[UIImage imageNamed:@"placeholder.png"] 
                             cacheKey:md5String 
                             compression:0.5];
    }
}

```
