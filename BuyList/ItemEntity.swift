//
//  ItemEntity.swift
//  BuyList
//
//  Created by y-maki on 2018/07/11.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation

final class ItemEntity {
    var buyId: String
    var itemId: String
    var name: String
    var count: Int
    var createTime: Date
    var checkTime: Date?

    init(buyId: String, itemId: String, itemName: String, count: Int, createTime: Date, checkTime: Date? = nil) {
        self.buyId = buyId
        self.itemId = itemId
        self.name = itemName
        self.count = count
        self.createTime = createTime
        self.checkTime = checkTime
    }
}
