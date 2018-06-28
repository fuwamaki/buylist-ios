//
//  UITableViewCell+Addition.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/05/26.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    class func defaultHeight(_ tableView: UITableView) -> CGFloat {
        return 44.0
    }
    
    class var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
