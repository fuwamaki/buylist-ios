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

protocol BuyListTableCell {
}

struct BuyListItemTableCell: BuyListTableCell {
    var name: String?
    var count: Int?

    init(name: String? = nil, count: Int? = nil) {
        self.name = name
        self.count = count
    }
}

struct BuyListAddTableCell: BuyListTableCell {
    var title: String = "項目を追加"
}

protocol BuyListDelegate: class {
    func reloadData()
    func displayErrorAlert(_ errorMessage: String)
}

protocol BuyListEventHandler {
    var numberOfItems: Int { get }
    func cellForRow(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func editingStyleForRowAt(indexPath: IndexPath) -> UITableViewCell.EditingStyle
    func commitEditingStyle(editingStyle: UITableViewCell.EditingStyle, indexPath: IndexPath)
    func didSelectRow(indexPath: IndexPath)
    func insertItemCell()
    func setBuyListItems()
    func saveAddItem(_ name: String?)
}

class BuyListPresenter: NSObject, BuyListEventHandler, BuyListDelegate {

    var buyListTableViewResource = BuyListTableViewResource()
    var interactable: BuyListInteractable
    weak var userInterface: BuyListUserInterface?
    var buyListTableCells: [BuyListTableCell] = []

    func setBuyListTableCells() {
        buyListTableCells = interactable.items.compactMap { BuyListItemTableCell(name: $0.name, count: $0.count) }
        buyListTableCells.append(BuyListAddTableCell())
    }

    init(userInterface: BuyListUserInterface, interactable: BuyListInteractable) {
        self.userInterface = userInterface
        self.interactable = interactable
    }

    func insertItemCell() {
        buyListTableCells.removeLast()
        buyListTableCells.append(BuyListItemTableCell())
        userInterface?.reloadTableView()
    }

    // MARK: BuyListDelegate
    func reloadData() {
        userInterface?.dismissHud()
        setBuyListTableCells()
        userInterface?.reloadTableView()
    }

    func displayErrorAlert(_ errorMessage: String) {
        userInterface?.dismissHud()
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        print(errorMessage)
        alert.addAction(UIAlertAction(title: "Close", style: .default))
        userInterface?.showAlert(alert)
    }

    // MARK: BuyListEventHandler
    func setBuyListItems() {
        userInterface?.showHud()
        interactable.getItems()
    }

    func saveAddItem(_ name: String?) {
        if let name = name {
            interactable.saveItem(name: name, count: 1)
            buyListTableViewResource.setEditingItemName(name)
        }
    }

    var numberOfItems: Int {
        return buyListTableCells.count
    }

    func cellForRow(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        if let cell = buyListTableCells[indexPath.row] as? BuyListItemTableCell {
            let buyListItemCell = tableView.dequeueCellForIndexPath(indexPath) as BuyListItemCell
            buyListItemCell.setItemText(name: cell.name, count: cell.count)
            return buyListItemCell
        } else if let cell = buyListTableCells[indexPath.row] as? BuyListAddTableCell {
            let buyListAddCell = tableView.dequeueReusableCell(withIdentifier: "buyListAddTableCell", for: indexPath)
            buyListAddCell.textLabel?.text = cell.title
            return buyListAddCell
        } else {
            fatalError("Failed to dequeue cell.")
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
            userInterface?.deleteTableViewRow(indexPath: indexPath)
        }
    }

    func didSelectRow(indexPath: IndexPath) {
        if buyListTableCells[indexPath.row] is BuyListItemTableCell {
            Debug.log("item selected")
        } else if buyListTableCells[indexPath.row] is BuyListAddTableCell {
            insertItemCell()
        } else {
            fatalError("Failed to dequeue cell.")
        }
    }
}
