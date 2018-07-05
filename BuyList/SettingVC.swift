//
//  SettingVC.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/06/02.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import UIKit

// MEMO: Static Cellsは、親ViewがUITableViewControllerじゃないといけない。
class SettingVC: UITableViewController, SettingUserInterface {

    private var eventHandler: SettingEventHandler?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "設定"
        setupViews()
        setVersionValue()
    }

    private func setupViews() {
        let presenter = SettingPresenter(self)
        let interactor = SettingInteractor()
        self.eventHandler = presenter
        presenter.interactor = interactor
        interactor.delegate = presenter
        tableView.delegate = presenter
    }

    func setVersionValue() {
        let versionCell = VersionCell()
        versionCell.setupVersion()
    }

    func reloadTableView() {
        tableView.reloadData()
    }
}

class VersionCell: UITableViewCell {
    func setupVersion() {
        self.detailTextLabel?.text = "ためにし"
    }
}
