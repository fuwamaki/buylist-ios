//
//  AppInfo.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/09.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation

struct AppInfo {
    static var appVersion: String {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"]! as! String
    }

    static var buildVersion: String {
        return Bundle.main.infoDictionary!["CFBundleVersion"]! as! String
    }
}
