//
//  BuyListHistoryViewController.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/08/18.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import UIKit

class BuyListHistoryViewController: UIViewController {

    private var eventHandler: BuyListHistoryEventHandler?
    @IBOutlet private weak var tableView: UITableView!

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
        tableView.registerForCell(BuyListHistoryCell.self)
    }
}

extension BuyListHistoryViewController: BuyListHistoryUserInterface {
}
