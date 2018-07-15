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
        var name: String?
        let type: BuyListTableCellType

        init(name: String? = nil, type: BuyListTableCellType) {
            self.name = name
            self.type = type
        }
    }

    private var isAppendEmptyItemCell: Bool = false
    var itemCells: [TableCell] = []
    let addCell = TableCell(name: Constant.addTitle, type: .add)

    private var tableSections: [TableSection] {
        let itemSection = TableSection(cells: itemCells)
        let addSection = TableSection(cells: [addCell])
        return [itemSection, addSection]
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

    mutating func appendItemCell(_ item: ItemEntity) {
        itemCells.append(TableCell(name: item.name, type: .item))
    }

    mutating func appendEmptyItemCell() {
        if !isAppendEmptyItemCell {
            itemCells.append(TableCell(type: .item))
            isAppendEmptyItemCell = true
        }
    }

    mutating func setEmptyItemName(_ name: String) {
        if isAppendEmptyItemCell {
            itemCells[itemCells.count].name = name
            isAppendEmptyItemCell = false
        }
    }

    mutating func removeItemCell(_ index: Int) {
        itemCells.remove(at: index)
    }
}
