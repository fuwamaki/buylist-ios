//
//  BuyListContainerViewController.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/12.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation
import UIKit

protocol BuyListContainerDelegate: class {
    func addItemCell()
}

class BuyListContainerViewController: UIViewController {

    @IBAction private func clickAddItemButton(_ sender: Any) {
        Debug.log("click add item button")
        containerDelegate?.addItemCell()
    }

    weak var containerDelegate: BuyListContainerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? BuyListViewController {
            containerDelegate = viewController
        }
    }
}
