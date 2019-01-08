//
//  SettingViewController.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/06/02.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import UIKit

// MEMO: Static Cellsは、親ViewがUITableViewControllerじゃないといけない。
class SettingViewController: UITableViewController {

    private var eventHandler: SettingEventHandler?
    @IBOutlet weak var versionText: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = SettingPresenter(self)
        self.eventHandler = presenter
        setupTableView(presenter)
        eventHandler?.displayAppVersion()
    }

    private func setupTableView(_ presenter: SettingPresenter) {
        tableView.delegate = presenter
    }
}

extension SettingViewController: SettingUserInterface {

    func setVersionText(_ version: String) {
        versionText.text = version
    }
}
