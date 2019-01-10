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
    func saveAddItem(_ name: String?)
    var numberOfSections: Int { get }
    func numberOfRowsInSection(section: Int) -> Int
    func titleForHeaderInSection(section: Int) -> String?
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func editingStyleForRowAt(indexPath: IndexPath) -> UITableViewCell.EditingStyle
    func commitEditingStyle(editingStyle: UITableViewCell.EditingStyle, indexPath: IndexPath)
    func setBuyListItem()
}

protocol BuyListDelegate {
}

class BuyListPresenter: NSObject, BuyListEventHandler, BuyListDelegate {

    var buyListTableViewResource = BuyListTableViewResource()
    var interactable: BuyListInteractable
    var userInterface: BuyListUserInterface

    init(userInterface: BuyListUserInterface, interactable: BuyListInteractable) {
        self.userInterface = userInterface
        self.interactable = interactable
    }

    private func insertItemCell() {
        buyListTableViewResource.appendEditingItemCell()
        userInterface.reloadTableView()
    }

    func setBuyListItem() {
//        let items = interactable.getItems()
//        for item in items {
//            buyListTableViewResource.appendItemCell(item)
//        }
        userInterface.reloadTableView()
    }

    // MARK: BuyListEventHandler
    func saveAddItem(_ name: String?) {
        if let name = name {
            interactable.saveItem(name: name, count: 1)
            buyListTableViewResource.setEditingItemName(name)
        }
    }

    var numberOfSections: Int {
        return buyListTableViewResource.tableSectionCount
    }

    func numberOfRowsInSection(section: Int) -> Int {
        return buyListTableViewResource[section]?.cells.count ?? 0
    }

    func titleForHeaderInSection(section: Int) -> String? {
        return buyListTableViewResource[section]?.title
    }

    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = buyListTableViewResource[indexPath.section]?.cells[indexPath.row] else {
            fatalError("Failed to dequeue cell.")
        }
        switch cell.type {
        case .item:
            let buyListItemCell = tableView.dequeueCellForIndexPath(indexPath) as BuyListItemCell
            buyListItemCell.setItemText(name: cell.name, count: cell.count)
            return buyListItemCell
        case .add:
            let buyListAddCell = tableView.dequeueCellForIndexPath(indexPath) as BuyListAddCell
            return buyListAddCell
        }
    }

    func editingStyleForRowAt(indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        guard let cell = buyListTableViewResource[indexPath.section]?.cells[indexPath.row] else {
            return .none
        }
        switch cell.type {
        case .item:
            return .delete
        case .add:
            return .insert
        }
    }

    func commitEditingStyle(editingStyle: UITableViewCell.EditingStyle, indexPath: IndexPath) {
        if editingStyle == .delete {
            buyListTableViewResource.removeItemCell(indexPath.row)
            userInterface.deleteTableViewRow(indexPath: indexPath)
        }
    }

    func didSelectRowAt(indexPath: IndexPath) {
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
