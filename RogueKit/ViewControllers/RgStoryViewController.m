//
//  RgStoryViewController.m
//  RogueKitDemo
//
//  Created by Rogue on 16/3/18.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgStoryViewController.h"

@interface RgStoryViewController ()
@property (weak, nonatomic) IBOutlet UIButton *redButton;

@property (weak, nonatomic) IBOutlet UIButton *greenButton;
@end

@implementation RgStoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)touchGreenButton:(id)sender {
    
    NSLog(@"绿色");
    
}

- (IBAction)touchRedButton:(id)sender {
    
    NSLog(@"dadaw");
    
}

@end
