//
//  MainTabBarController.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/07/11.
//  Copyright © 2018 牧 宥作. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    enum TabNumber: Int {
        case buylist = 0
        case history = 1
        case setting = 2
    }

    struct TabItem {
        let title: String
        let tabNumber: TabNumber

        init(title: String, tabNumber: TabNumber) {
            self.title = title
            self.tabNumber = tabNumber
        }
    }

    var tabItems: [TabItem] {
        return [TabItem(title: "買い物", tabNumber: .buylist),
                TabItem(title: "履歴", tabNumber: .history),
                TabItem(title: "設定", tabNumber: .setting)]
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
        if let index = tabBar.items?.firstIndex(of: item) {
            navigationItem.title = tabItems[index].title
        }
    }
}
