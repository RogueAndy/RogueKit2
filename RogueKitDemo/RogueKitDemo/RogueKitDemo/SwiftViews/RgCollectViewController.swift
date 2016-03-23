//
//  RgCollectViewController.swift
//  RogueKitDemo
//
//  Created by Rogue on 16/3/4.
//  Copyright © 2016年 Rogue. All rights reserved.
//

import UIKit

class RgCollectViewController: RogueBaseViewContorller {

    private var collectView: RgCollectView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.loadSubView()
        self.loadLayout()
        
    }
    
    private func loadSubView() {
        
        view.backgroundColor = .yellowColor()
    
        collectView = RgCollectView(frame: CGRectMake(0, 80, 320, 160), datas: ["11", "22", "33", "44", "55", "66", "77", "88", "99"])
        collectView.backgroundColor = .whiteColor()
        view.addSubview(collectView)
    
    }
    
    private func loadLayout() {
    
        
    
    }
    
}
