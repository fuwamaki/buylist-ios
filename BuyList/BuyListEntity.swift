//
//  BuyListEntity.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/11.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation
import RealmSwift

class BuyListEntity: Object {
    @objc dynamic var id: String = NSUUID().uuidString
    @objc dynamic var name: String?
    @objc dynamic var count: Int = 1
    @objc dynamic var create_time: Date = Date()
    @objc dynamic var buy_on_time_recently: Date = Date()
    @objc dynamic var buy_off_time_recently: Date = Date()

    convenience init (name: String) {
        self.init()
        self.name = name
    }

    override static func primaryKey() -> String? {
        return "id"
    }
}
