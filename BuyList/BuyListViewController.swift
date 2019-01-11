//
//  BuyListViewController.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/06/02.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import UIKit
import KRProgressHUD

protocol BuyListUserInterface: class, UITextFieldDelegate {
    func showHud()
    func dismissHud()
    func showAlert(_ alert: UIAlertController)
    func reloadTableView()
    func deleteTableViewRow(indexPath: IndexPath)
}

class BuyListViewController: UIViewController, BuyListUserInterface {

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.registerForCell(BuyListItemCell.self)
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "buyListAddTableCell")
        }
    }

    private var eventHandler: BuyListEventHandler!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViper()
        setupViews()
        eventHandler.setBuyListItems()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    private func setupViper() {
        let interactor = BuyListInteractor()
        let presenter = BuyListPresenter(userInterface: self, interactable: interactor)
        interactor.delegate = presenter
        eventHandler = presenter
    }

    private func setupViews() {
        view.pinSubview(tableView, margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        tableView.backgroundColor = UIColor.baseGray
    }

    // MARK: BuyListUserInterface
    func showHud() {
        KRProgressHUD.show()
    }

    func dismissHud() {
        KRProgressHUD.dismiss()
    }

    func showAlert(_ alert: UIAlertController) {
        self.present(alert, animated: true, completion: nil)
    }

    func reloadTableView() {
        tableView.reloadData()
    }

    func deleteTableViewRow(indexPath: IndexPath) {
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}

extension BuyListViewController: BuyListContainerDelegate {
    func addItemCell() {
        eventHandler.insertItemCell()
    }
}

extension BuyListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventHandler.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return eventHandler.cellForRow(tableView: tableView, indexPath: indexPath)
    }

    func editingStyleForRowAt(indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return eventHandler.editingStyleForRowAt(indexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        eventHandler.commitEditingStyle(editingStyle: editingStyle, indexPath: indexPath)
    }
}

extension BuyListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        eventHandler.didSelectRow(indexPath: indexPath)
    }
}

extension BuyListViewController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        // TODO: 編集時にもsaveされてしまっているので要修正
        eventHandler.saveAddItem(textField.text)
    }
}
