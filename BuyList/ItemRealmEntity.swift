//
//  ItemRealmEntity.swift
//  BuyList
//
//  Created by Maki, Yusaku | Mackey | ECID on 2019/01/10.
//  Copyright © 2019年 牧 宥作. All rights reserved.
//

import Foundation
import RealmSwift

class ItemRealmEntity: Object {
    @objc dynamic var itemId: Int = 0
    @objc dynamic var name: String = String.phi
    @objc dynamic var count: Int = 0
    @objc dynamic var createTime: Date = Date()
    @objc dynamic var checkTime: Date?
}
