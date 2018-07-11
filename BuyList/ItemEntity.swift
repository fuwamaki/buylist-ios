//
//  ItemEntity.swift
//  BuyList
//
//  Created by y-maki on 2018/07/11.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation

final class ItemEntity {
    var id: String
    var name: String
    var count: Int
    var createTime: Date
    var boughtTime: Date

    init(id: String, name: String, count: Int, createTime: Date, boughtTime: Date) {
        self.id = id
        self.name = name
        self.count = count
        self.createTime = createTime
        self.boughtTime = boughtTime
    }
}
