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
    func getTableViewCell(_ indexPath: IndexPath) -> UITableViewCell
}

class SettingPresenter: NSObject, SettingEventHandler, SettingDelegate {
    
    var settingTableViewResource: SettingTableViewResource = SettingTableViewResource()
    var interactor: SettingInteractable?
    var userInterface: SettingUserInterface
    
    init(_ userInterface: SettingUserInterface) {
        self.userInterface = userInterface
    }

    func viewWillAppear() {
        userInterface.reloadTableView()
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return userInterface.getTableViewCell(indexPath)
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
