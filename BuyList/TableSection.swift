//
//  TableSection.swift
//  BuyList
//
//  Created by y-maki on 2018/07/02.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

struct TableSection {
    let title: String?
    let cells: [TableCell]
    
    init(title: String? = nil, cells: [TableCell]) {
        self.title = title
        self.cells = cells
    }
}
