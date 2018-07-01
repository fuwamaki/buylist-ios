//
//  BuyListVC.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/06/02.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import UIKit

class BuyListVC: UIViewController, BuyListUserInterface {
    
    fileprivate struct Constant {
        static let title = "買い物リスト"
    }
    
    private var presenter: BuyListPresenter
    private var interactor: BuyListInteractor
    private var eventHandler: BuyListEventHandler?
    
    init() {
        presenter = BuyListPresenter()
        interactor = BuyListInteractor()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        presenter = BuyListPresenter()
        interactor = BuyListInteractor()
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.parent?.navigationItem.title = Constant.title
        setupViper()
        self.eventHandler?.setBuyListContent()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func setupViper() {
        presenter.interactor = interactor
        interactor.delegate = presenter
        self.eventHandler = presenter
        presenter.userInterface = self
    }
    
    func setupViews(_ tableView: UITableView) {
        view.pinSubview(tableView, margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        tableView.registerForCell(BuyListContentCell.self)
        tableView.registerForCell(BuyListAddContentCell.self)
    }
    
    func reloadTableView(_ tableView: UITableView) {
        tableView.reloadData()
    }
    
    func getBuyListContentCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueCellForIndexPath(indexPath) as BuyListContentCell
    }
    
    func getBuyListAddContentCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueCellForIndexPath(indexPath) as BuyListAddContentCell
    }
}

