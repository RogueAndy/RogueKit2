//
//  RgCollectViewItem.swift
//  RogueKitDemo
//
//  Created by Rogue on 16/3/4.
//  Copyright © 2016年 Rogue. All rights reserved.
//

import UIKit

class RgCollectViewItem: UIView {
    
    private let itemIndex: Int!
    private var longPress: Int -> Void!
    private var delete: Int -> Void!
    private var touch: Int -> Void!

    init (index: Int, longPress: Int -> Void, delete: Int -> Void, touch: Int -> Void) {
    
        self.itemIndex = index
        self.longPress = longPress
        self.delete = delete
        self.touch = touch
        super.init(frame: CGRectZero)
        
        self.loadDatas()
        self.loadSubView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadDatas() {
    
        self.userInteractionEnabled = true
        self.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: Selector("longPressBlock")))
    
    }
    
    private func loadSubView() {
    
        self.layer.borderColor = UIColor.grayColor().CGColor
        self.layer.borderWidth = 0.5
        
    }
    
    private func loadLayout() {
        
        
    }
    
    
    
    @objc private func longPressBlock() {
    
        self.longPress(self.itemIndex)
    
    }
    
}
