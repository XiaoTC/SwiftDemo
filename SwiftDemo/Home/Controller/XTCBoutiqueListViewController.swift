//
//  XTCBoutiqueListViewController.swift
//  SwiftDemo
//
//  Created by chenhao on 2018/7/23.
//  Copyright © 2018年 zxd. All rights reserved.
//

import UIKit
import LLCycleScrollView


class XTCBoutiqueListViewController: XTCBaseViewController {
    private var galleryItems = [GalleryItemModel]()
    
    var comicLists = [ComicListModel]()
    
    
    
    private lazy var bannerView: LLCycleScrollView = {
        let bw = LLCycleScrollView()
        bw.backgroundColor = UIColor.background
        bw.autoScrollTimeInterval = 6
        bw.placeHolderImage = UIImage(named: "normal_placeholder")
        bw.coverImage = UIImage()
        bw.pageControlPosition = .right
        bw.pageControlBottom = 20
        bw.titleBackgroundColor  = UIColor.clear
        return bw
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: 120, height: 100)
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = UIColor.background
        collection.contentInset = UIEdgeInsetsMake(screenWidth * 0.467, 0, 0, 0)
        //collection.delegate = self
        collection.dataSource = self
        collection.register(cellType: XTCComicCollectionViewCell.self)
        collection.register(cellType: XTCBoardCollectionViewCell.self)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
       
    }

    
    private func loadData(){
        ApiLoadingProvider.request(UApi.boutiqueList(sexType: 1), model: BoutiqueListModel.self) { [weak self] (returnData) in
            self?.galleryItems = returnData?.galleryItems ?? []
            self?.comicLists = returnData?.comicLists ?? []
            self?.collectionView.reloadData()
            
            self?.bannerView.imagePaths = self?.galleryItems.filter{$0.cover != nil }.map { $0.cover!} ?? []
        }
    }
    
    override func configUI() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        view.addSubview(bannerView)
        bannerView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(collectionView.contentInset.top)
        }
    }
    

}

extension XTCBoutiqueListViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return comicLists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let comicList = comicLists[section]
        return comicList.comics?.prefix(4).count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let comicList = comicLists[indexPath.section]
        if comicList.comicType == .billboard {
            let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: XTCBoardCollectionViewCell.self)
            cell.model = comicList.comics?[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: XTCComicCollectionViewCell.self)
            if comicList.comicType == .thematic {
                cell.style = .none
            } else {
                cell.style = .withTitleAndDesc
            }
            cell.model = comicList.comics?[indexPath.row]
            return cell
        }
    }
    

}

