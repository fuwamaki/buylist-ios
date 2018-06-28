//
//  BuyListViewDto.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/12.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation

final class BuyListContentDto {
    var id:String
    var title:String
    // TODO: 項目の追加
//    var count:Int
//    var description:String
//    var create_time:String
//    var update_time:String
    
    init(id:String, title:String) {
        self.id = id
        self.title = title
    }
}
