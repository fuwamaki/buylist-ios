//
//  BuyListHistoryPresenter.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/08/18.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import UIKit

protocol BuyListHistoryEventHandler {
}

protocol BuyListHistoryUserInterface: class {
    func getBuyListHistoryDequeueCell(_ indexPath: IndexPath) -> UITableViewCell
}

class BuyListHistoryPresenter: NSObject {
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

extension BuyListHistoryPresenter: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userInterface.getBuyListHistoryDequeueCell(indexPath)
        cell.textLabel?.text = "sample"
        return cell
    }
}

extension BuyListHistoryPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
