//
//  BuyListViewDto.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/12.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation

final class BuyListContentDto {
    var id: String
    var title: String
//    var count: Int
//    var description: String
//    var createTime: String
//    var updateTime: String

    init(id: String, title: String) {
        self.id = id
        self.title = title
    }
}
