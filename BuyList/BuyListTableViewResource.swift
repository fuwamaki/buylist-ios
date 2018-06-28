//
//  BuyListTableViewResource.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/12.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation

struct BuyListTableViewResource {
    var buyListContentSectionInfo = BuyListContentSectionInfo()
    var buyListAddContentSectionInfo = BuyListAddContentSectionInfo()
    
    private var sectionList: [BuyListSectionInfo] {
        return [buyListContentSectionInfo, buyListAddContentSectionInfo]
    }
    
    var sectionListCount: Int {
        return sectionList.count
    }
    
    subscript (index: Int) -> BuyListSectionInfo? {
        get {
            guard sectionList.count > index else {
                return nil
            }
            return sectionList[index]
        }
    }
}
