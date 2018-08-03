//
//  XTCHomeViewController.swift
//  SwiftDemo
//
//  Created by xiaotianchi on 2018/7/23.
//  Copyright © 2018年 zxd. All rights reserved.
//

import UIKit

class XTCHomeViewController: XTCPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
    }

    override func configNavigationBar() {
        super.configNavigationBar()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_search"), target: self, action: #selector(selectAction))
    }
   
    @objc private func selectAction() {
        navigationController?.pushViewController(XTCSearchViewController(), animated: true)
    }


}
