//
//  SettingViewCellDto.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/09.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation

enum SettingContents {
    case notification, version
}

protocol SettingViewCellDto {
    var title: String { get }
    var content: SettingContents { get }
    var eventLabel: String { get }
}
