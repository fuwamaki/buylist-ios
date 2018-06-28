//
//  SettingVC.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/06/02.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import UIKit

class SettingVC:UIViewController,SettingUserInterface {

    var eventHandler: SettingEventHandler?
    @IBOutlet weak var settingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.parent?.navigationItem.title = "設定"
        
        let presenter = SettingPresenter()
        let interactor = SettingInteractor()
        presenter.interactor = interactor
        interactor.delegate = presenter
        self.eventHandler = presenter
        presenter.userInterface = self
        settingTableView.dataSource = presenter
        settingTableView.delegate = presenter
        settingTableView.register(UINib(nibName: SettingContentCell.identifier, bundle: nil), forCellReuseIdentifier: SettingContentCell.identifier)
//        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func getSettingCell(_ dto:SettingViewCellDto) -> UITableViewCell {
        let cell = settingTableView.dequeueReusableCell(withIdentifier: SettingContentCell.identifier) as! SettingContentCell
        cell.setContentTitle(dto)
        if dto.eventLabel == "appversion" {
            guard let appVersion = eventHandler?.getAppVersion() else {
                return UITableViewCell()
            }
            cell.setAppVersion(appVersion)
        }
        return cell
    }
    
    func reloadTableView() {
        settingTableView.reloadData()
    }
}

