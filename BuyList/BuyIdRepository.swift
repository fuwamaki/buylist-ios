//
//  BuyIdRepository.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/07/20.
//  Copyright © 2018 牧 宥作. All rights reserved.
//

import Foundation

// buyIdをauto increment管理するクラス
final class BuyIdRepository {

    private var buyIds: [Int]?

    func setBuyIds(_ items: [ItemEntity]) {
        var ids: [Int] = []
        items.forEach {
            ids.append($0.itemId)
        }
        buyIds = ids
    }

    func getNewItemId() -> String? {
        guard let lastId = buyIds?.last else {
            return nil
        }
        return String(lastId + 1)
    }
}
