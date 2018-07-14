//
//  SampleRealm.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/07/20.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import Foundation
import RealmSwift

enum RealmAction {
    case find, save, delete, update
}

class ItemRealmEntity: Object {
    @objc dynamic var buyId: String = "0001"
    @objc dynamic var itemId: String = "0001"
    @objc dynamic var name: String = ""
    @objc dynamic var count: Int = 0
    @objc dynamic var createTime: Date = Date()
    @objc dynamic var checkTime: Date?
}

final class ItemRealm {

    func realmAction(action: RealmAction, item: ItemRealmEntity? = nil) -> [ItemEntity]? {

        let realm = try! Realm()
        switch action {
        case .find:
            var items: [ItemEntity] = []
            let objects = realm.objects(ItemRealmEntity.self)
            objects.forEach {
                items.append(ItemEntity(buyId: $0.buyId, itemId: $0.itemId, name: $0.name, count: $0.count, createTime: $0.createTime))
            }
            return items
        case .save:
            try! realm.write {
                if let item = item {
                    realm.add(item)
                }
            }
            return nil
        case .delete:
            try! realm.write {
                if let item = item {
                    realm.delete(item)
                }
            }
            return nil
        case .update:
            try! realm.write {
                if let item = item {
                    realm.add(item, update: true)
                }
            }
            return nil
        }
    }
}
