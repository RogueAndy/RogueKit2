//
//  RgUpimageViewController.m
//  RogueKitDemo
//
//  Created by Rogue on 16/2/1.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgUpimageViewController.h"
#import "RogueNetworkManager.h"

@interface RgUpimageViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIButton *leftButton;

@property (nonatomic, strong) UIButton *rightButton;

@end

@implementation RgUpimageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _imageView.backgroundColor = [UIColor grayColor];
    _imageView.frame = CGRectMake(40, 80, CGRectGetWidth(self.view.bounds) - 80, 120);
    [self.view addSubview:_imageView];
    
    _leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _leftButton.backgroundColor = [UIColor orangeColor];
    _leftButton.frame = CGRectMake(40, 250, 100, 40);
    [_leftButton addTarget:self action:@selector(left) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_leftButton];
    
    _rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _rightButton.backgroundColor = [UIColor blueColor];
    _rightButton.frame = CGRectMake(CGRectGetWidth(self.view.bounds) - 140, 250, 100, 40);
    [_rightButton addTarget:self action:@selector(right) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_rightButton];
    
}

- (void)left {
    
    UIImagePickerController *vc = [[UIImagePickerController alloc] init];
    vc.delegate = self;
    vc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:vc animated:YES completion:nil];

}

- (void)right {
    
    NSData *datas = UIImageJPEGRepresentation(_imageView.image, 0.5);

    [RogueNetworkManager apiMethod:@"testUploadImageAction" parameters:@{@"userid":@"1111111"} completeBlock:^(BOOL status, NSDictionary *responseObj, NSString *responseMessage) {
        NSLog(@"dwadawwd");
    }];
    
//    [RogueNetworkManager apiMethod:@"testUploadImageAction"
//                            stream:datas
//                        parameters:@{@"userid":@"1111111"}
//                     completeBlock:^(BOOL status, NSDictionary *responseObj, NSString *responseMessage) {
//                         NSLog(@"%@", responseObj);
//                     }];

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary<NSString *,id> *)editingInfo {
    
    _imageView.image = image;
    [picker dismissViewControllerAnimated:YES completion:nil];

}

@end
