//
//  ItemEntity.swift
//  BuyList
//
//  Created by y-maki on 2018/07/11.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation

final class ItemEntity {
    var itemId: Int
    var name: String
    var count: Int
    var createTime: Date
    var checkTime: Date?

    init(itemId: Int, name: String, count: Int, createTime: Date, checkTime: Date? = nil) {
        self.itemId = itemId
        self.name = name
        self.count = count
        self.createTime = createTime
        self.checkTime = checkTime
    }
}
