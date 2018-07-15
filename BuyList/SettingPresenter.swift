//
//  SettingPresenter.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/08/18.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import Foundation
import UIKit

enum SettingTableCellType {
    // section1: detailed settings
    case notification
    // section2: about this service
    case inquiry, version
}

protocol SettingEventHandler {
    func displayAppVersion()
}

protocol SettingUserInterface: class {
    func setVersionText(_ version: String)
}

class SettingPresenter: NSObject {

    var settingTableViewResource = SettingTableViewResource()
    var interactor: SettingInteractable
    var userInterface: SettingUserInterface

    init(_ userInterface: SettingUserInterface) {
        let interactor = SettingInteractor()
        self.userInterface = userInterface
        self.interactor = interactor
    }
}

extension SettingPresenter: SettingEventHandler {

    func displayAppVersion() {
        userInterface.setVersionText(interactor.getAppVersion())
    }
}

// MEMO: StaticCellsではDataSourceの指定不要
extension SettingPresenter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = settingTableViewResource[indexPath.section]?.cells[indexPath.row] {
            switch cell.type {
            case .notification:
                // TODO: 通知機能
                Debug.log("notification")
            case .inquiry:
                // TODO: 問い合わせ機能
                Debug.log("inquiry")
            case .version:
                Debug.log("version tapped")
            }
        }
    }
}
