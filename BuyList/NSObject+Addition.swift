//
//  NSObject+Addition.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/09.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation

extension NSObject {
    
    static var className:String {
        let fullname = NSStringFromClass(self)
        if let lastDotIndex = fullname.lastIndexOf(".") {
            let index = fullname.index(after: lastDotIndex)
            return String(fullname.suffix(from: index))
        } else {
            return fullname
            
        }
    }
}

extension String {
    func lastIndexOf(_ character: Character) -> Index? {
        var last: Index?
        for i in self.indices {
            if self[i] == character {
                last = i
            }
        }
        return last
    }
}
