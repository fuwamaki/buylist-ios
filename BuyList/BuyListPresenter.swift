//
//  BuyListPresenter.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/08/18.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import Foundation
import UIKit

enum BuyListTableCellType {
    case item
    case add
}

protocol BuyListEventHandler {
    func setBuyListItem()
}

protocol BuyListItemCellEventHandler {
    func saveAddItem(_ name: String?)
}

protocol BuyListUserInterface: class {
    func reloadTableView()
}

class BuyListPresenter: NSObject {

    var buyListTableViewResource = BuyListTableViewResource()
    var interactable: BuyListInteractable
    var userInterface: BuyListUserInterface

    init(_ userInterface: BuyListUserInterface) {
        let interactor = BuyListInteractor()
        self.userInterface = userInterface
        self.interactable = interactor
    }

    private func insertItemCell() {
        buyListTableViewResource.appendEmptyItemCell()
        userInterface.reloadTableView()
    }
}

extension BuyListPresenter: BuyListEventHandler {

    func setBuyListItem() {
        let items = interactable.getItems()
        for item in items {
            buyListTableViewResource.appendItemCell(item)
        }
        userInterface.reloadTableView()
    }
}

extension BuyListPresenter: BuyListItemCellEventHandler {

    func saveAddItem(_ name: String?) {
        if let name = name {
            interactable.saveItem(name: name, count: 1)
            buyListTableViewResource.setEmptyItemName(name)
        }
    }
}

extension BuyListPresenter: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return buyListTableViewResource.tableSectionCount
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buyListTableViewResource[section]?.cells.count ?? 0
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return buyListTableViewResource[section]?.title
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = buyListTableViewResource[indexPath.section]?.cells[indexPath.row] {
            switch cell.type {
            case .item:
                let buyListItemCell = tableView.dequeueCellForIndexPath(indexPath) as BuyListItemCell
                buyListItemCell.setItemTitle(cell.name)
                return buyListItemCell
            case .add:
                let buyListAddCell = tableView.dequeueCellForIndexPath(indexPath) as BuyListAddCell
                return buyListAddCell
            }
        } else {
            fatalError("Failed to dequeue cell.")
        }
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if let cell = buyListTableViewResource[indexPath.section]?.cells[indexPath.row] {
            switch cell.type {
            case .item:
                return .delete
            case .add:
                return .insert
            }
        }
        return .none
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            buyListTableViewResource.removeItemCell(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension BuyListPresenter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = buyListTableViewResource[indexPath.section]?.cells[indexPath.row] {
            switch cell.type {
            case .item:
                Debug.log("item selected")
            case .add:
                insertItemCell()
            }
        }
    }
}
