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
}

class BuyListHistoryPresenter: NSObject {
    var interactor: BuyListHistoryInteractable
    var userInterface: BuyListHistoryUserInterface
    // mock
    var mockItemEntity: MockItemEntity

    init(_ userInterface: BuyListHistoryUserInterface) {
        let interactor = BuyListHistoryInteractor()
        self.userInterface = userInterface
        self.interactor = interactor
        // mock
        mockItemEntity = MockItemEntity()
        mockItemEntity.insertBuyListHistory()
    }
}

extension BuyListHistoryPresenter: BuyListHistoryEventHandler {
}

extension BuyListHistoryPresenter: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // mock
        return mockItemEntity.mockItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCellForIndexPath(indexPath) as BuyListHistoryTableCell
        // mock
        cell.setLabel(mockItemEntity.mockItems[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
}

extension BuyListHistoryPresenter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
