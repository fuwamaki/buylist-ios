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

final class ItemRealm {

    func convertItemEntity(item: ItemEntity) -> ItemRealmEntity {
        let itemRealmEntity = ItemRealmEntity()
        itemRealmEntity.itemId = item.itemId
        itemRealmEntity.name = item.name
        itemRealmEntity.count = item.count
        itemRealmEntity.createTime = item.createTime
        return itemRealmEntity
    }

    func findItems(completion: @escaping (Result<[ItemEntity], NSError>) -> Void) {
        do {
            let realm = try Realm()
            var items: [ItemEntity] = []
            let objects = realm.objects(ItemRealmEntity.self)
            objects.forEach {
                items.append(ItemEntity(itemId: $0.itemId, name: $0.name, count: $0.count, createTime: $0.createTime))
            }
            completion(.success(items))
        } catch let error as NSError {
            completion(.failure(error))
        }
    }

    func saveItem(item: ItemEntity, completion: @escaping (Result<ItemEntity, NSError>) -> Void) {
        let itemRealmEntity = convertItemEntity(item: item)
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(itemRealmEntity)
                completion(.success(item))
            }
        } catch let error as NSError {
            completion(.failure(error))
        }
    }

    func deleteItem(item: ItemEntity, completion: @escaping (Result<Any?, NSError>) -> Void) {
        do {
            let realm = try Realm()
            let deleteItem = realm.objects(ItemRealmEntity.self).filter { $0.itemId == item.itemId }
            try realm.write {
                realm.delete(deleteItem)
                completion(.success(nil))
            }
        } catch let error as NSError {
            completion(.failure(error))
        }
    }

    func updateItem(item: ItemEntity, completion: @escaping (Result<Any?, NSError>) -> Void) {
        let itemRealmEntity = convertItemEntity(item: item)
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(itemRealmEntity, update: true)
                completion(.success(nil))
            }
        } catch let error as NSError {
            completion(.failure(error))
        }
    }
}
