//
//  SettingTableViewResource.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/09.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation

struct SettingTableViewResource {

    struct TableSection {
        let title: String?
        let cells: [TableCell]

        init(title: String? = nil, cells: [TableCell]) {
            self.title = title
            self.cells = cells
        }
    }

    struct TableCell {
        let title: String?
        let type: SettingTableCellType

        init(title: String? = nil, type: SettingTableCellType) {
            self.title = title
            self.type = type
        }
    }

    let notificationCell = TableCell(type: .notification)
    let inquiryCell = TableCell(type: .inquiry)
    let versionCell = TableCell(type: .version)

    private var tableSections: [TableSection] {
        let detailedSettingsSection = TableSection(cells: [notificationCell])
        let aboutThisServiceSection = TableSection(cells: [inquiryCell, versionCell])
        return [detailedSettingsSection, aboutThisServiceSection]
    }

    var tableSectionsCount: Int {
        return tableSections.count
    }

    subscript (index: Int) -> TableSection? {
        guard tableSections.count > index else {
            return nil
        }
        return tableSections[index]
    }
}
