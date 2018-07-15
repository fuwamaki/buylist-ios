//
//  UIFont+Addition.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/05/27.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import UIKit

extension UIFont {

    private class func boldFont(_ size: CGFloat) -> UIFont {
        return UIFont.boldSystemFont(ofSize: size)
    }

    private class func standardFont(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }

    class var title: UIFont {
        return boldFont(18.0)
    }

    class var sectionTitle: UIFont {
        return boldFont(14.0)
    }

    class var bodyText: UIFont {
        return standardFont(14.0)
    }

    class var subText: UIFont {
        return standardFont(12.0)
    }
}
