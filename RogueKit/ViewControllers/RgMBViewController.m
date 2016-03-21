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

    [RgLoadingController showLoadingSoonDisplayActivityViewOn:self hudType:RgLoadingGIF titleOrGif:@"RgRefresh" withAfter:2 withComplete:nil];
    
}


@end
