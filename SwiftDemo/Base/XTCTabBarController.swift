//
//  XTCTabBarController.swift
//  SwiftDemo
//
//  Created by chenhao on 2018/7/20.
//  Copyright © 2018年 zxd. All rights reserved.
//

import UIKit

class XTCTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        
        /// 首页
        let onePageVC = XTCHomeViewController(titles: ["推荐",
                                                     "VIP",
                                                     "订阅",
                                                     "排行"],
                                            vcs: [XTCBoutiqueListViewController(),
                                                  XTCVIPListViewController(),
                                                  XTCSubscribeListViewController(),
                                                  XTCRankListViewController()],
                                            pageStyle: .navigationBarSegment)
        addChildViewController(onePageVC,
                               title: "首页",
                               image: UIImage(named: "tab_home"),
                               selectedImage: UIImage(named: "tab_home_S"))
        
        
        /// 分类
        let classVC = XTCCateListViewController()
        addChildViewController(classVC,
                               title: "分类",
                               image: UIImage(named: "tab_class"),
                               selectedImage: UIImage(named: "tab_class_S"))


        /// 书架
        let bookVC = XTCBookViewController(titles: ["收藏",
                                                  "书单",
                                                  "下载"],
                                         vcs: [XTCCollectionListViewController(),
                                               XTCDocumentListViewController(),
                                               XTCDownloadListViewController()],
                                         pageStyle: .navigationBarSegment)
        addChildViewController(bookVC,
                               title: "书架",
                               image: UIImage(named: "tab_book"),
                               selectedImage: UIImage(named: "tab_book_S"))


        // 我的
        let mineVC = XTCMineViewController()
        addChildViewController(mineVC,
                               title: "我的",
                               image: UIImage(named: "tab_mine"),
                               selectedImage: UIImage(named: "tab_mine_S"))
    }
    
    func addChildViewController(_ childController: UIViewController, title:String?, image:UIImage? ,selectedImage:UIImage?) {
        
        childController.title = title
        childController.tabBarItem = UITabBarItem(title: nil,
                                                  image: image?.withRenderingMode(.alwaysOriginal),
                                                  selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            childController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        }
        addChildViewController(XTCNavigationController(rootViewController: childController))
    }

}

extension XTCTabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let select = selectedViewController else { return .lightContent }
        return select.preferredStatusBarStyle
    }
}
