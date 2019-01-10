//
//  BuyListTableViewResource.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/12.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation

// TODO: 面倒くさいから消す
struct BuyListTableViewResource {

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
        var count: Int?
        let type: BuyListTableCellType

        init(name: String? = nil, type: BuyListTableCellType, count: Int? = nil) {
            self.name = name
            self.type = type
            self.count = count
        }
    }

    // 編集中のItemがあるかどうかのフラグ
    private var isEditingItemCell: Bool = false

    private var itemCells: [TableCell] = []
    private let addCells = [TableCell(name: "項目を追加", type: .add)]

    private var tableSections: [TableSection] {
        let itemSection = TableSection(cells: itemCells)
        let addSection = TableSection(cells: addCells)
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
        itemCells.append(TableCell(name: item.name, type: .item, count: item.count))
    }

    mutating func appendEditingItemCell() {
        if !isEditingItemCell {
            itemCells.append(TableCell(type: .item))
            isEditingItemCell = true
        }
    }

    mutating func setEditingItemName(_ name: String) {
        if isEditingItemCell {
            itemCells[itemCells.count].name = name
            isEditingItemCell = false
        }
    }

    mutating func removeItemCell(_ index: Int) {
        itemCells.remove(at: index)
    }
}
