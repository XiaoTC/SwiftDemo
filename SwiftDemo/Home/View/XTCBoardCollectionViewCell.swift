//
//  XTCBoardCollectionViewCell.swift
//  SwiftDemo
//
//  Created by xiaotianchi on 2018/8/2.
//  Copyright © 2018年 zxd. All rights reserved.
//

import UIKit

class XTCBoardCollectionViewCell: XTCBaseCollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    
    override func configUI() {
        clipsToBounds = true
        
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(40)
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom)
            $0.left.right.equalToSuperview().inset(UIEdgeInsetsMake(0, 10, 0, 10))
            $0.height.equalTo(20)
        }
    }
    
    var model: ComicModel? {
        didSet {
            guard let model = model else { return }
            imageView.kf.setImage(urlString: model.cover)
            titleLabel.text = model.name
        }
    }
}
