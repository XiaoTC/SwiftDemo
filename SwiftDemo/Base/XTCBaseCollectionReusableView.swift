//
//  XTCBaseCollectionReusableView.swift
//  SwiftDemo
//
//  Created by chenhao on 2018/8/3.
//  Copyright © 2018年 zxd. All rights reserved.
//

import UIKit

class XTCBaseCollectionReusableView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configUI() {}
}
