//
//  XTCBoutiqueListViewController.swift
//  SwiftDemo
//
//  Created by chenhao on 2018/7/23.
//  Copyright © 2018年 zxd. All rights reserved.
//

import UIKit



class XTCBoutiqueListViewController: XTCBaseViewController {
    private var galleryItems = [GalleryItemModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
       
    }

    
    private func loadData(){
        ApiLoadingProvider.request(UApi.boutiqueList(sexType: 1), model: BoutiqueListModel.self) { [weak self] (returnData) in
            self?.galleryItems = returnData?.galleryItems ?? []
        }
    }

}
