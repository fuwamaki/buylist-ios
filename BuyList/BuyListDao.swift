//
//  BuyListDao.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/11.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation
import RealmSwift

class BuyListDao {
    func saveBuyList(_ name: String) {
        let realm = try! Realm()
        let buyListEntity = BuyListEntity(name: name)
        do {
            try realm.write {
                realm.add(buyListEntity)
            }
        } catch {
            Debug.log("realm -> \(error)")
        }
    }

    func getBuyList() -> BuyListEntity? {
        let realm = try! Realm()
        guard let object = realm.objects(BuyListEntity.self).first else {
            return nil
        }
        return object
    }
}
