//
//  BuyListTableInfo.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/12.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation

enum BuyListCellType {
    case content
    case addContent
}

protocol BuyListSectionInfo {
    var title: String? { get }
    var cellInfo: [BuyListTableInfo] { get set }
}

extension BuyListSectionInfo {
    var rowCount: Int { return cellInfo.count }
}

protocol BuyListTableInfo {
    var buyListContentDto: BuyListContentDto? { get }
    var cellType: BuyListCellType { get }
}

struct BuyListContentSectionInfo: BuyListSectionInfo {
    var title: String? = nil
    
    struct BuyListContentCell: BuyListTableInfo {
        var buyListContentDto: BuyListContentDto?
        var cellType: BuyListCellType = .content
    }
    
    var cellInfo: [BuyListTableInfo] = []
    
    mutating func append(_ contentCell: BuyListContentCell) {
        cellInfo.append(contentCell)
    }
}

struct BuyListAddContentSectionInfo: BuyListSectionInfo {
    var title: String? = nil
    var rowCount: Int = 1
    
    struct BuyListAddContentCell: BuyListTableInfo {
        var buyListContentDto: BuyListContentDto? = nil
        var cellType: BuyListCellType = .addContent
    }
    
    var cellInfo: [BuyListTableInfo] = [BuyListAddContentCell()]
}
