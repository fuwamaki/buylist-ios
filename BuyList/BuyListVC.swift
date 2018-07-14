//
//  BuyListVC.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/06/02.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import UIKit

class BuyListVC: UIViewController {

    private var eventHandler: BuyListEventHandler?
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = BuyListPresenter(self)
        eventHandler = presenter
        setupViews()
        setupTableView(presenter)
        eventHandler?.setBuyListContent()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    private func setupViews() {
        view.pinSubview(tableView, margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        tableView.backgroundColor = UIColor.baseGray
    }

    private func setupTableView(_ presenter: BuyListPresenter) {
        tableView.delegate = presenter
        tableView.dataSource = presenter
        tableView.registerForCell(BuyListContentCell.self)
        tableView.registerForCell(BuyListAddContentCell.self)
    }
}

extension BuyListVC: BuyListUserInterface {

    func reloadTableView() {
        tableView.reloadData()
    }
}
