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
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = BuyListHistoryPresenter(self)
        eventHandler = presenter
        setupTableView(presenter)
    }

    private func setupTableView(_ presenter: BuyListHistoryPresenter) {
        tableView.delegate = presenter
        tableView.dataSource = presenter
        tableView.backgroundColor = UIColor.baseGray
        tableView.registerForCell(BuyListHistoryTableCell.self)
    }
}

extension BuyListHistoryVC: BuyListHistoryUserInterface {
}
