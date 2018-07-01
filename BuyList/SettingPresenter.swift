//
//  SettingPresenter.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/08/18.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import Foundation
import UIKit

protocol SettingEventHandler {
    func viewWillAppear()
    func getAppVersion() -> String
}

protocol SettingUserInterface: class {
    func reloadTableView()
    func getSettingCell(_ dto: SettingViewCellDto) -> UITableViewCell
}

class SettingPresenter: NSObject, UITableViewDelegate, UITableViewDataSource, SettingEventHandler, SettingDelegate {
    var settingTableViewResource: SettingTableViewResource = SettingTableViewResource()
    var interactor: SettingInteractable?
    weak var userInterface: SettingUserInterface?

    func viewWillAppear() {
        userInterface?.reloadTableView()
    }

    func getAppVersion() -> String {
        guard let appVersion = interactor?.getAppVersion() else {
            return ""
        }
        return appVersion
    }

    func didGetUserData() {
    }

    // MARK: tableview

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {//セル数設定
        guard let count = settingTableViewResource[section]?.rowCount else {
            return 0
        }
        return count
    }

    func numberOfSections(in tableView: UITableView) -> Int {//セクション数設定
        return settingTableViewResource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {//セル値設定
        let sectionInfo = settingTableViewResource[(indexPath as NSIndexPath).section]
        let cellInfo = sectionInfo?.cellTypes[(indexPath as NSIndexPath).row]
        if let cellInfo = cellInfo, let userInterface = userInterface {
            return userInterface.getSettingCell(cellInfo)
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {//セクションヘッダータイトル設定
        let sectionInfo = settingTableViewResource[section]
        return sectionInfo?.title
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {//選択時挙動設定
        let sectionInfo = settingTableViewResource[(indexPath as NSIndexPath).section]
        let cellInfo = sectionInfo?.cellTypes[(indexPath as NSIndexPath).row]
        if let cellInfo = cellInfo {
            switch cellInfo.content {
            case .notification:
                //TODO: 通知設定の処理
                print("push notification setting")
            default:
                return
            }
        }
    }
}
