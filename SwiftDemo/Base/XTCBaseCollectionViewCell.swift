//
//  XTCBaseCollectionViewCell.swift
//  SwiftDemo
//
//  Created by chenhao on 2018/8/2.
//  Copyright © 2018年 zxd. All rights reserved.
//

import UIKit
import Reusable

class XTCBaseCollectionViewCell: UICollectionViewCell, Reusable{
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configUI() {}
}
