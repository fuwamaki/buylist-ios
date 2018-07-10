//
//  SettingVC.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/06/02.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import UIKit

// MEMO: Static Cellsは、親ViewがUITableViewControllerじゃないといけない。
class SettingVC: UITableViewController {

    private var eventHandler: SettingEventHandler?
    @IBOutlet weak var versionText: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        eventHandler?.displayAppVersion()
    }

    private func setupViews() {
        let presenter = SettingPresenter(self)
        self.eventHandler = presenter
        tableView.delegate = presenter
    }
}

extension SettingVC: SettingUserInterface {

    func setVersionText(_ version: String) {
        versionText.text = version
    }
}
