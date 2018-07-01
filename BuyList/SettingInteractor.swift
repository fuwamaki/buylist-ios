//
//  SettingInteractor.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/08/18.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import Foundation

protocol SettingInteractable {
    func getAppVersion() -> String
}

protocol SettingDelegate: class {
    func didGetUserData()
}

class SettingInteractor: SettingInteractable {
    weak var delegate: SettingDelegate?

    func getAppVersion() -> String {
        return AppInfo.appVersion
    }
}
