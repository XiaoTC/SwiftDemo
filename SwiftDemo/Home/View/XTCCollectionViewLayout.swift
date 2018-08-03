//
//  XTCCollectionViewLayout.swift
//  SwiftDemo
//
//  Created by chenhao on 2018/8/3.
//  Copyright © 2018年 zxd. All rights reserved.
//

import UIKit
private let SectionBackground = "UCollectionReusableView"

private class TXCCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
    
}

private class XTCCollectionReusableView: UICollectionReusableView {
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        
    }
}

class XTCCollectionViewLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(){
        self.register(UICollectionReusableView.classForCoder(), forDecorationViewOfKind: SectionBackground)
    }
    
    
}
