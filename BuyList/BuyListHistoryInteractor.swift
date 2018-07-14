//
//  BuyListHistoryInteractor.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/08/18.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import Foundation

protocol BuyListHistoryInteractable {
}

class BuyListHistoryInteractor: BuyListHistoryInteractable {
    // TODO: 履歴を取得して返すクラス
    func getBuyHistory() -> [ItemEntity] {
        let item = ItemEntity(buyId: "0", itemId: "0", name: "test", count: 1, createTime: Date())
        return [item]
    }
}
