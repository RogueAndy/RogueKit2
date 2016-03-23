//
//  RogueViewController.m
//  RogueKitDemo
//
//  Created by Rogue on 16/1/19.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RogueViewController.h"
#import "RogueViewControllerTranstion.h"

@interface RogueViewController ()

@end

@implementation RogueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.delegate = self;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0) {

    
    return [RogueViewControllerTranstion new];
//    
//    if(operation == UINavigationControllerOperationPush ) {
//        
////        return [RogueViewControllerTranstion transtionWithAnimationType:RogueAlphaTranstion duration:0.4 viewControllerClasses:nil];
//        
//    } else if(operation == UINavigationControllerOperationPop) {
//        
//        return [RogueViewControllerTranstion transtionWithAnimationType:RogueAlphaTranstion duration:0.4 viewControllerClasses:nil];
//        
//    } else {
//        
//        return nil;
//        
//    }
    
}

- (void)dealloc {

    NSLog(@"--- %@", [self class]);

}


@end
