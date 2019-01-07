//
//  BuyListVC.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/06/02.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import UIKit

protocol BuyListUserInterface: class, UITextFieldDelegate {
    func reloadTableView()
    func deleteTableViewRow(indexPath: IndexPath)
}

class BuyListVC: UIViewController, BuyListUserInterface {

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.registerForCell(BuyListItemCell.self)
            tableView.registerForCell(BuyListAddCell.self)
        }
    }

    private var eventHandler: BuyListEventHandler!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViper()
        setupViews()
        eventHandler.setBuyListItem()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    private func setupViper() {
        let interactor = BuyListInteractor()
        let presenter = BuyListPresenter(userInterface: self, interactable: interactor)
        eventHandler = presenter
    }

    private func setupViews() {
        view.pinSubview(tableView, margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        tableView.backgroundColor = UIColor.baseGray
    }

    // MARK: BuyListUserInterface
    func reloadTableView() {
        tableView.reloadData()
    }

    func deleteTableViewRow(indexPath: IndexPath) {
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}

extension BuyListVC: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return eventHandler.numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventHandler.numberOfRowsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return eventHandler.titleForHeaderInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return eventHandler.cellForRowAt(tableView: tableView, indexPath: indexPath)
    }

    func editingStyleForRowAt(indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return eventHandler.editingStyleForRowAt(indexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        eventHandler.commitEditingStyle(editingStyle: editingStyle, indexPath: indexPath)
    }
}

extension BuyListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension BuyListVC {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        // TODO: 編集時にもsaveされてしまっているので要修正
        eventHandler.saveAddItem(textField.text)
    }
}
