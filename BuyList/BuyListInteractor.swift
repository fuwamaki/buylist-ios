//
//  BuyListInteractor.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/08/18.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import Foundation

protocol BuyListInteractable {
    var items: [ItemEntity] { get }
    func getItems()
    func saveItem(name: String, count: Int)
    func deleteItem(indexPath: IndexPath)
    func updateItem(item: ItemEntity)
}

class BuyListInteractor: BuyListInteractable {

    weak var delegate: BuyListDelegate?
    var itemRealm = ItemRealm()
    var items: [ItemEntity] = []

    func getItems() {
        itemRealm.findItems { [weak self] result in
            switch result {
            case .success(let items):
                self?.items = items
                self?.delegate?.reloadData()
            case .failure(let error):
                self?.delegate?.displayErrorAlert(error.description)
            }
        }
    }

    func saveItem(name: String, count: Int) {
        let item = ItemEntity(itemId: getDistinctItemId(), name: name, count: count, createTime: Date())
        itemRealm.saveItem(item: item) { [weak self] result in
            switch result {
            case .success(let item):
                self?.items.append(item)
                self?.delegate?.reloadData()
            case .failure(let error):
                self?.delegate?.displayErrorAlert(error.description)
            }
        }
    }

    func deleteItem(indexPath: IndexPath) {
        itemRealm.deleteItem(item: items[indexPath.row]) { [weak self] result in
            switch result {
            // swiftlint:disable empty_enum_arguments
            case .success(_):
                self?.items.remove(at: indexPath.row)
                self?.delegate?.deleteItemRow(indexPath: indexPath)
            case .failure(let error):
                self?.delegate?.displayErrorAlert(error.description)
            }
        }
    }

    func updateItem(item: ItemEntity) {
        itemRealm.updateItem(item: item) { [weak self] result in
            switch result {
            // swiftlint:disable empty_enum_arguments
            case .success(_):
                print("success")
            case .failure(let error):
                self?.delegate?.displayErrorAlert(error.description)
            }
        }
    }

    // 0からカウントしていて、空いていた重複しないid値を返す
    func getDistinctItemId() -> Int {
        let itemIds = items.compactMap { return $0.itemId }
        var itemId = 0
        repeat {
            itemId += 1
        } while(itemIds.contains(itemId))
        return itemId
    }
}
