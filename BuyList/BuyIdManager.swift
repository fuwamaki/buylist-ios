//
//  BuyIdManager.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/07/20.
//  Copyright © 2018 牧 宥作. All rights reserved.
//

import Foundation

// buyIdをauto increment管理するクラス
final class BuyIdManager {

    private var buyIds: [Int]?

    func setBuyIds(_ items: [ItemEntity]) {
        var ids: [Int] = []
        items.forEach{ if let id = Int($0.buyId) { ids.append(id) } }
        buyIds = ids
    }

    func getNewItemId() -> String? {
        guard let lastId = buyIds?.last else {
            return nil
        }
        return String(lastId + 1)
    }
}
