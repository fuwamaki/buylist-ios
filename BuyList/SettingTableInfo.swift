//
//  SettingTableInfo.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/09.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation

protocol SettingSectionInfo {
    var title: String? {get}
    var rowCount: Int {get}
    var cellTypes: [SettingViewCellDto] {get}
}

extension SettingSectionInfo {
    var rowCount: Int { return cellTypes.count }
}

class SettingNotificationSectionInfo: SettingSectionInfo {
    var title: String? = "通知"
    var cellTypes: [SettingViewCellDto] {
        return [NotificationSettingCell()]
    }
    struct NotificationSettingCell: SettingViewCellDto {
        var title = "通知設定"
        var content = SettingContents.notification
        var eventLabel =  "notification"
    }
}

class SettingAppInfoSectionInfo: SettingSectionInfo {
    var title: String? = "基本情報"
    var cellTypes: [SettingViewCellDto] {
        return [VersionSettingCell()]
    }

    struct VersionSettingCell: SettingViewCellDto {
        var title = "バージョン"
        var content = SettingContents.version
        var eventLabel =  "appversion"
    }
}
