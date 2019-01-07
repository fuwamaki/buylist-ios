//
//  MainTabBarController.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/07/11.
//  Copyright © 2018 牧 宥作. All rights reserved.
//

import UIKit

enum TabBarNumber: Int {
    case buyList = 0
    case buyListHistory = 1
    case setting = 2
}

struct TabBarItem {
    let title: String
    let tabNumber: TabBarNumber
    
    init(title: String, tabNumber: TabBarNumber) {
        self.title = title
        self.tabNumber = tabNumber
    }
}

class MainTabBarController: UITabBarController {

    var tabItems: [TabBarItem] {
        return [TabBarItem(title: "買い物リスト", tabNumber: .buyList),
                TabBarItem(title: "買い物履歴", tabNumber: .buyListHistory),
                TabBarItem(title: "設定", tabNumber: .setting)]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabView()
    }

    private func setTabView() {
        selectedIndex = tabItems.startIndex
        navigationItem.title = tabItems[tabItems.startIndex].title
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let items = tabBar.items, let itemIndex = items.index(of: item) {
            navigationItem.title = tabItems[itemIndex].title
        }
    }
}
