//
//  BuyListPresenter.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/08/18.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import Foundation
import UIKit

protocol BuyListEventHandler {
    func setBuyListContent()
}

protocol BuyListUserInterface: class {
    func setupViews(_ tableView: UITableView)
    func reloadTableView(_ tableView: UITableView)
    func getBuyListContentCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func getBuyListAddContentCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}

class BuyListPresenter: NSObject, BuyListEventHandler, BuyListDelegate {

    var buyListTableViewInfo: BuyListTableViewResource = BuyListTableViewResource()
    var interactor: BuyListInteractable?
    weak var userInterface: BuyListUserInterface?

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        userInterface?.setupViews(tableView)
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.setEditing(true, animated: false)
//        tableView.allowsSelectionDuringEditing = true
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 1))
        return tableView
    }()

    func setBuyListContent() {
        if let buyListArray = interactor?.getBuyListData() {
            for content in buyListArray {
                var contentCellInfo = BuyListContentSectionInfo.BuyListContentCell()
                contentCellInfo.buyListContentDto = BuyListContentDto(id: content.id, title: content.thing)
                buyListTableViewInfo.buyListContentSectionInfo.append(contentCellInfo)
            }
        }
        userInterface?.reloadTableView(tableView)
    }
}

extension BuyListPresenter: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return buyListTableViewInfo.sectionListCount
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buyListTableViewInfo[section]?.rowCount ?? 0
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionInfo = buyListTableViewInfo[section]
        return sectionInfo?.title
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let userInterface = userInterface, let cellInfo = buyListTableViewInfo[indexPath.section]?.cellInfo[indexPath.row] {
            switch cellInfo.cellType {
            case .content:
                if let cell = userInterface.getBuyListContentCell(tableView: tableView, indexPath: indexPath) as? BuyListContentCell,
                    let contentDto = cellInfo.buyListContentDto {
                    cell.setContentTitle(contentDto)
                    return cell
                }
            case .addContent:
                return userInterface.getBuyListAddContentCell(tableView: tableView, indexPath: indexPath)
            }
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if let cellInfo = buyListTableViewInfo[indexPath.section]?.cellInfo[indexPath.row] {
            switch cellInfo.cellType {
            case .content:
                return .delete
            case .addContent:
                return .insert
            }
        }
        return .none
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if var sectionInfo = buyListTableViewInfo[indexPath.section], editingStyle == .delete {
            sectionInfo.cellInfo.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension BuyListPresenter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
