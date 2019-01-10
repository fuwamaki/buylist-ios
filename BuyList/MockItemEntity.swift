//
//  MockItem.swift
//  BuyList
//
//  Created by y-maki on 2018/07/14.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation

final class MockItemEntity {

    var mockItems: [ItemEntity] = []

    func insertBuyListHistory() {
        mockItems.append(ItemEntity(itemId: 0, name: "シャンプー", count: 1, createTime: Date()))
        mockItems.append(ItemEntity(itemId: 0, name: "牛乳", count: 1, createTime: Date()))
        mockItems.append(ItemEntity(itemId: 0, name: "卵", count: 6, createTime: Date()))
        mockItems.append(ItemEntity(itemId: 0, name: "豆腐", count: 1, createTime: Date()))
        mockItems.append(ItemEntity(itemId: 0, name: "のど飴", count: 2, createTime: Date()))
    }
}
