//
//  UITableViewHeaderFooterView+Addition.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/05/26.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation

import UIKit

extension UITableViewHeaderFooterView {

    class func defaultHeight(_ tableView: UITableView) -> CGFloat {
        return 32.0
    }

    class var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
