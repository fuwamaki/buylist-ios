//
//  SettingVC.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/06/02.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import UIKit

class SettingVC: UITableViewController, SettingUserInterface {

    private var eventHandler: SettingEventHandler?
    @IBOutlet weak var settingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "設定"
        setupViews()
    }

    private func setupViews() {
        let presenter = SettingPresenter(self)
        let interactor = SettingInteractor()
        self.eventHandler = presenter
        presenter.interactor = interactor
        interactor.delegate = presenter
        settingTableView.dataSource = presenter
        settingTableView.delegate = presenter
    }

    func getTableViewCell(_ indexPath: IndexPath) -> UITableViewCell {
        return super.tableView(settingTableView, cellForRowAt: indexPath)
    }
//    func getSettingCell(_ dto: SettingViewCellDto) -> UITableViewCell {
//        let cell = settingTableView.dequeueReusableCell(withIdentifier: SettingContentCell.identifier) as! SettingContentCell
//        cell.setContentTitle(dto)
//        if dto.eventLabel == "appversion" {
//            guard let appVersion = eventHandler?.getAppVersion() else {
//                return UITableViewCell()
//            }
//            cell.setAppVersion(appVersion)
//        }
//        return cell
//    }

    func reloadTableView() {
        settingTableView.reloadData()
    }
}
