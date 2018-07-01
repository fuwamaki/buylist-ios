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

class SettingPresenter: NSObject, SettingEventHandler, SettingDelegate {
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
}

extension SettingPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = settingTableViewResource[section]?.rowCount else {
            return 0
        }
        return count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingTableViewResource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionInfo = settingTableViewResource[(indexPath as NSIndexPath).section]
        let cellInfo = sectionInfo?.cellTypes[(indexPath as NSIndexPath).row]
        if let cellInfo = cellInfo, let userInterface = userInterface {
            return userInterface.getSettingCell(cellInfo)
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionInfo = settingTableViewResource[section]
        return sectionInfo?.title
    }
}

extension SettingPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionInfo = settingTableViewResource[(indexPath as NSIndexPath).section]
        let cellInfo = sectionInfo?.cellTypes[(indexPath as NSIndexPath).row]
        if let cellInfo = cellInfo {
            switch cellInfo.content {
            case .notification:
                print("push notification setting")
            default:
                return
            }
        }
    }
}
