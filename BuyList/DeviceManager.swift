//
//  DeviceManager.swift
//  BuyList
//
//  Created by y-maki on 2018/07/13.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation
import AdSupport

class DeviceManager {

    func getAdvertisingIdentifier() -> String {
        return ASIdentifierManager.shared().advertisingIdentifier.uuidString
    }
}
