//
//  NibLoadable.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/05/26.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import UIKit

protocol NibLoadable {
    static var nibName: String { get }
    static func loadNib(_ bundle: Bundle?) -> UINib
    static func instantiateFromNib(_ bundle: Bundle?) -> Self
}

extension NibLoadable {

    static var nibName: String {
        return String(describing: self)
    }

    static func loadNib(_ bundle: Bundle? = nil) -> UINib {
        let bundle = bundle ?? Bundle.main
        return UINib(nibName: nibName, bundle: bundle)
    }

    static func instantiateFromNib(_ bundle: Bundle? = nil) -> Self {
        return loadNib(bundle).instantiate(withOwner: nil, options: nil).first as! Self
    }
}
