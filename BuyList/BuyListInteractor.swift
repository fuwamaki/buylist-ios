//
//  BuyListInteractor.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/08/18.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import Foundation

protocol BuyListInteractable {
    func getBuyListData() -> [SampleJsonData.Rows]?
}

protocol BuyListDelegate: class {
}

class BuyListInteractor: BuyListInteractable {
    weak var delegate: BuyListDelegate?
    let loadJsonFile = LoadJsonFile()

    func getBuyListData() -> [SampleJsonData.Rows]? {
        guard let sampleJsonData = loadJsonFile.getJson() else {
            return nil
        }
        return sampleJsonData.rows
    }
}
