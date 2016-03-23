//
//  RgMBViewController.m
//  RogueKitDemo
//
//  Created by Rogue on 16/3/21.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgMBViewController.h"
#import "UIImageView+RgGIF.h"
#import "RgLoadingController.h"

@interface RgMBViewController ()

@end

@implementation RgMBViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [RgLoadingController showLoadingActivityViewOn:self hudType:RgLoadingGIF titleOrGif:@"RgRefresh"];
    
    NSString *hanzi = @"中国大地";
    NSMutableString *ms = [[NSMutableString alloc] initWithString:hanzi];
    if(CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformMandarinLatin, NO)) {
        NSLog(@"%@", ms);
    }
    if(CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformStripDiacritics, NO)) {
        NSLog(@"%@", ms);
    }
    
}


@end
