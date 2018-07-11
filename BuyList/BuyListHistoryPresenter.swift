//
//  BuyListHistoryPresenter.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/08/18.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import Foundation

protocol BuyListHistoryEventHandler {
}

protocol BuyListHistoryUserInterface: class {
}

class BuyListHistoryPresenter {
    var interactor: BuyListHistoryInteractable
    var userInterface: BuyListHistoryUserInterface

    init(_ userInterface: BuyListHistoryUserInterface) {
        let interactor = BuyListHistoryInteractor()
        self.userInterface = userInterface
        self.interactor = interactor
    }
}

extension BuyListHistoryPresenter: BuyListHistoryEventHandler {
}
