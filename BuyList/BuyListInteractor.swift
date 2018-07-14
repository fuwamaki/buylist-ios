//
//  BuyListInteractor.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/08/18.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import Foundation

protocol BuyListInteractable {
    func getBuyListData() -> [ItemEntity]
}

class BuyListInteractor: BuyListInteractable {

    let loadJsonFile = LoadJsonFile()

    func getBuyListData() -> [ItemEntity] {
        var items: [ItemEntity] = []
        if let jsonDate = loadJsonFile.getJson() {
            jsonDate.rows.forEach {
                items.append(ItemEntity(buyId: "1", itemId: $0.itemId, itemName: $0.name, count: $0.count, createTime: Date()))
            }
        }
        return items
    }
}
