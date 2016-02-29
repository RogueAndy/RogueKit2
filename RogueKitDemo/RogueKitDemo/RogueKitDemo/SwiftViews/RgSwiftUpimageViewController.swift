//
//  RgSwiftUpimageViewController.swift
//  RogueKitDemo
//
//  Created by Rogue on 16/2/1.
//  Copyright © 2016年 Rogue. All rights reserved.
//

import UIKit
import SnapKit

class RgSwiftUpimageViewController: RogueBaseViewContorller, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var imageView = UIImageView()
    var leftButton = UIButton(type: .System)
    var rightButton = UIButton(type: .System)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadSubView()
        self.loadLayout()
        
    }
    
    private func loadSubView() {
    
        self.view.backgroundColor = .whiteColor()
        
        self.imageView.backgroundColor = .grayColor()
        
        self.leftButton.backgroundColor = .orangeColor()
        self.rightButton.backgroundColor = .blueColor()
        
        self.leftButton.addTarget(self, action: Selector("left"), forControlEvents: .TouchUpInside)
        self.rightButton.addTarget(self, action: Selector("right"), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.imageView)
        self.view.addSubview(self.leftButton)
        self.view.addSubview(self.rightButton)
        
    }
    
    private func loadLayout() {
    
        self.imageView.snp_makeConstraints { (make) -> Void in
            
            make.left.equalTo(self.view.snp_left).offset(40)
            make.right.equalTo(self.view.snp_right).offset(-40)
            make.top.equalTo(self.view.snp_top).offset(120)
            make.height.equalTo(80)
            
        }
        
        self.leftButton.snp_makeConstraints { (make) -> Void in
            
            make.left.equalTo(self.view.snp_left).offset(30)
            make.top.equalTo(self.imageView.snp_bottom).offset(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
            
        }
        
        self.rightButton.snp_makeConstraints { (make) -> Void in
            
            make.right.equalTo(self.view.snp_right).offset(-30)
            make.top.equalTo(self.imageView.snp_bottom).offset(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
            
        }
    
    }
    
    func left() {
    
        let imageController = UIImagePickerController()
        imageController.delegate = self
        imageController.sourceType = .PhotoLibrary
        self.presentViewController(imageController, animated: true, completion: nil)
    
    }
    
    func right() {
    
    
    
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {

        self.imageView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }

}
