//
//  HomeScreenQuickAction.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/09.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation
import UIKit

enum QuickActionItem: String {
    case top, history, setting
    init?(fullType: String) {
        guard let last = fullType.components(separatedBy: ".").last else { return nil }
        self.init(rawValue: last)
    }
}

class HomeScreenQuickAction {

    // MARK: create

    func createHomeScreenQuickAction() {
        let shortcut1 = UIMutableApplicationShortcutItem (
            type: QuickActionItem.top.rawValue,
            localizedTitle: "トップ",
            localizedSubtitle: "",
            icon: UIApplicationShortcutIcon(type: .home),
            userInfo: nil
        )
        let shortcut2 = UIMutableApplicationShortcutItem (
            type: QuickActionItem.history.rawValue,
            localizedTitle: "履歴",
            localizedSubtitle: "",
            icon: UIApplicationShortcutIcon(type: .bookmark),
            userInfo: nil
        )
        let shortcut3 = UIMutableApplicationShortcutItem (
            type: QuickActionItem.setting.rawValue,
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
        switch shortcutItem.type {
        case QuickActionItem.top.rawValue:
            item = "TopView"
            handled = true
        case QuickActionItem.history.rawValue:
            item = "HistoryView"
            handled = true
        case QuickActionItem.setting.rawValue:
            item = "SettingView"
        default:
            break
        }
        return (handled, item)
    }
}
