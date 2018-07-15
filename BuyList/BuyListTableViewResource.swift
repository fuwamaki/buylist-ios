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
        var title: String?
        let type: BuyListTableCellType

        init(title: String? = nil, type: BuyListTableCellType) {
            self.title = title
            self.type = type
        }
    }

    private var isAppendEmptyContent: Bool = false
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
        contentCells.append(TableCell(title: item.name, type: .content))
    }

    mutating func appendEmptyContent() {
        if !isAppendEmptyContent {
            contentCells.append(TableCell(type: .content))
            isAppendEmptyContent = true
        }
    }

    mutating func setEmptyContentName(_ name: String) {
        if isAppendEmptyContent {
            contentCells[contentCells.count].title = name
            isAppendEmptyContent = false
        }
    }

    mutating func removeContent(_ index: Int) {
        contentCells.remove(at: index)
    }
}
