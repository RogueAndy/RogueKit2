//
//  UIImageView+RgGIF.m
//  RogueKitDemo
//
//  Created by Rogue on 16/3/21.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "UIImageView+RgGIF.h"
#import <ImageIO/ImageIO.h>

@implementation UIImageView (RgGIF)

+ (instancetype)initWithGIFName:(NSString *)name {
    
    UIImageView *imageView;
    
    NSString *gifPath = [[NSBundle mainBundle] pathForResource:name ofType:@"gif"];
    NSData *gifData = [NSData dataWithContentsOfFile:gifPath];
    NSMutableArray *frames = nil;
    CGImageSourceRef src = CGImageSourceCreateWithData((CFDataRef)gifData, NULL);
    double total = 0;
    NSTimeInterval gifAnimationDuration;
    if (src) {
        size_t l = CGImageSourceGetCount(src);
        if (l > 1){
            frames = [NSMutableArray arrayWithCapacity: l];
            for (size_t i = 0; i < l; i++) {
                CGImageRef img = CGImageSourceCreateImageAtIndex(src, i, NULL);
                NSDictionary *dict = (NSDictionary *)CFBridgingRelease(CGImageSourceCopyPropertiesAtIndex(src, 0, NULL));
                if (dict){
                    NSDictionary *tmpdict = [dict objectForKey: @"{GIF}"];
                    total += [[tmpdict objectForKey: @"DelayTime"] doubleValue];
                }
                if (img) {
                    [frames addObject: [UIImage imageWithCGImage: img]];
                    CGImageRelease(img);
                }
            }
            gifAnimationDuration = total / 4;
            
            imageView = [[UIImageView alloc] init];
            imageView.frame = CGRectMake(0, 0, 80, 80);
            imageView.animationImages = frames;
            imageView.animationDuration = gifAnimationDuration;
            [imageView startAnimating];
        }
    }

    return imageView;
}

@end
