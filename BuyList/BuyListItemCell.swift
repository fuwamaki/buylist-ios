//
//  BuyListItemCell.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/11.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import UIKit

class BuyListItemCell: UITableViewCell {

    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var countTextField: UITextField!

    var userInterface: BuyListTextFieldInterface? {
        didSet {
            nameTextField.delegate = userInterface
            countTextField.delegate = userInterface
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupDoneToolBar()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    func setItemText(name: String?, count: Int?) {
        if let name = name, let count = count {
            nameTextField.text = name
            countTextField.text = String(count)
        }
    }

    func setupDoneToolBar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let toolBarBtn = UIBarButtonItem(title: "DONE", style: .plain, target: self, action: #selector(touchDoneButton))
        toolBar.items = [toolBarBtn]
        nameTextField.inputAccessoryView = toolBar
        countTextField.inputAccessoryView = toolBar
    }

    @objc func touchDoneButton() {
        userInterface?.touchDoneButton(nameText: nameTextField.text, countText: countTextField.text)
    }
}

extension BuyListItemCell: NibLoadable {}
