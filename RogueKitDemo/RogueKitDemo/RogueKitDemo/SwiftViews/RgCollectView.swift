//
//  RgCollectView.swift
//  RogueKitDemo
//
//  Created by Rogue on 16/3/4.
//  Copyright © 2016年 Rogue. All rights reserved.
//

import UIKit

class RgCollectView: UIView {

    private var selectItem: RgCollectViewItem?
    private var scroll: UIScrollView!
    private var itemDatas: [String]!
    private var scale: Bool!
    
    init(frame: CGRect, datas: [String]) {
    
        self.itemDatas = datas
        super.init(frame: frame)
        self.loadSubView()
        self.loadLayout()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadSubView() {
        
        scroll = UIScrollView()
        scroll.frame = self.bounds
        
        self.addSubview(scroll)
    
        let width = CGRectGetWidth(self.frame) / 4.0
        let height = width
        
        if itemDatas.count % 4 == 0 {
            scroll.contentSize = CGSizeMake(CGRectGetWidth(scroll.frame), width * CGFloat(itemDatas.count / 4))
        } else {
            scroll.contentSize = CGSizeMake(CGRectGetWidth(scroll.frame), width * CGFloat(itemDatas.count / 4 + 1))
        }
        
        print(scroll.contentSize)
        
        weak var weakSelf = self
        var i = 0
        for title in itemDatas {
        
            print(title)
            let item = RgCollectViewItem(index: i, longPress: { (index: Int) -> Void in
                weakSelf!.longPressBlock(30000+index)
                }, delete: { (index: Int) -> Void in
                    weakSelf!.deleteBlock()
                }, touch: { (index: Int) -> Void in
                    weakSelf!.touchBlock()
            })

            let yIndex = i / 4
            let xIndex = i % 4
            item.frame = CGRectMake(CGFloat(xIndex) * width, CGFloat(yIndex) * height, width, height)
            item.tag = 30000 + i
            scroll.addSubview(item)
            
            i++
        }
    
    }
    
    private func loadLayout() {
    
    
    }

    private func longPressBlock(index: Int) {
    
        if scale == false {
        
            self.selectItem = scroll.viewWithTag(index) as? RgCollectViewItem
            UIView.animateWithDuration(0.3) { () -> Void in
                self.selectItem!.frame = CGRectMake(self.selectItem!.frame.origin.x - 10, self.selectItem!.frame.origin.y - 10, self.selectItem!.frame.size.width + 20, self.selectItem!.frame.size.height + 20)
            }
        
        }
        
    }
    
    private func deleteBlock() {
    
        print("删除")
        
    }
    
    private func touchBlock() {
    
        print("点击")
        
    }
    
}
