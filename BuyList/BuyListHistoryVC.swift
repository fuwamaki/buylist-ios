//
//  BuyListHistoryVC.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/08/18.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import UIKit

class BuyListHistoryVC: UIViewController {

    private var eventHandler: BuyListHistoryEventHandler?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        let presenter = BuyListHistoryPresenter(self)
        self.eventHandler = presenter
    }
}

extension BuyListHistoryVC: BuyListHistoryUserInterface {
}
