//
//  BuyListHistoryVC.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/08/18.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import UIKit

class BuyListHistoryVC:UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetting()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //ナビゲーションバーの設定
    func navigationBarSetting() {
        self.parent?.navigationItem.title = "買い物履歴"
    }
}