//
//  BuyListTableViewResource.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/12.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation

struct BuyListTableViewResource {

    private struct Constant {
        static let addTitle = "項目を追加"
    }
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
        let type: BuyListTableCellType

        init(title: String? = nil, type: BuyListTableCellType) {
            self.title = title
            self.type = type
        }
    }

    var contentCells: [TableCell] = []
    let addCell = TableCell(title: Constant.addTitle, type: .add)

    private var tableSections: [TableSection] {
        let contentSection = TableSection(cells: contentCells)
        let addSection = TableSection(cells: [addCell])
        return [contentSection, addSection]
    }

    var tableSectionCount: Int {
        return tableSections.count
    }

    subscript (index: Int) -> TableSection? {
        guard tableSections.count > index else {
            return nil
        }
        return tableSections[index]
    }

    mutating func appendContent(_ item: ItemEntity) {
        contentCells.append(TableCell(title: item.itemName, type: .content))
    }

    mutating func removeContent(_ index: Int) {
        contentCells.remove(at: index)
    }
}
