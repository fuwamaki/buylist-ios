//
//  HomeScreenQuickAction.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/09.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation
import UIKit

enum quickActionItem:String {
    case top, history, setting
    init?(fullType: String){
        guard let last = fullType.components(separatedBy: ".").last else { return nil }
        self.init(rawValue: last)
    }
}

class HomeScreenQuickAction {
    
    // MARK: create
    
    func createHomeScreenQuickAction() {
        let shortcut1 = UIMutableApplicationShortcutItem (
            type: quickActionItem.top.rawValue,
            localizedTitle: "トップ",
            localizedSubtitle: "",
            icon: UIApplicationShortcutIcon(type: .home),
            userInfo: nil
        )
        let shortcut2 = UIMutableApplicationShortcutItem (
            type: quickActionItem.history.rawValue,
            localizedTitle: "履歴",
            localizedSubtitle: "",
            icon: UIApplicationShortcutIcon(type: .bookmark),
            userInfo: nil
        )
        let shortcut3 = UIMutableApplicationShortcutItem (
            type: quickActionItem.setting.rawValue,
            localizedTitle: "設定",
            localizedSubtitle: "",
            icon: UIApplicationShortcutIcon(type: .share),
            userInfo: nil
        )
        UIApplication.shared.shortcutItems = [shortcut1, shortcut2, shortcut3]
    }
    
    // MARK: action
    
    func handleShortCutItem(shortcutItem: UIApplicationShortcutItem) -> (Bool, String) {
        var handled = false
        var item = ""
        switch(shortcutItem.type) {
        case quickActionItem.top.rawValue:
            item = "TopView"
            handled = true
        case quickActionItem.history.rawValue:
            item = "HistoryView"
            handled = true
        case quickActionItem.setting.rawValue:
            item = "SettingView"
        default:
            break
        }
        return (handled, item)
    }
}
