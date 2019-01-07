//
//  BuyListItemCell.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/11.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import UIKit

class BuyListItemCell: UITableViewCell {

    private var eventHandler: BuyListItemCellEventHandler
    private var textFieldNameLabel: UITextField
    private var textFieldCountLabel: UITextField

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        textFieldNameLabel = UITextField(frame: CGRect.null)
        textFieldCountLabel = UITextField(frame: CGRect.null)
        eventHandler = BuyListPresenter(BuyListVC())
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        textFieldNameLabel = UITextField(frame: CGRect.null)
        textFieldCountLabel = UITextField(frame: CGRect.null)
        eventHandler = BuyListPresenter(BuyListVC())
        super.init(coder: aDecoder)
        setupViews()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let nameLabelWidth = bounds.size.width - CGFloat.shortTextWidth - CGFloat.leftMargin
        textFieldNameLabel.frame = CGRect(x: CGFloat.leftMargin, y: 0, width: nameLabelWidth, height: bounds.size.height)
        textFieldCountLabel.frame = CGRect(x: nameLabelWidth, y: 0, width: CGFloat.shortTextWidth, height: bounds.size.height)
    }

    private func setupViews() {
        textFieldNameLabel.font = UIFont.bodyText
        textFieldNameLabel.textColor = UIColor.black
        textFieldNameLabel.delegate = self
        textFieldNameLabel.contentVerticalAlignment = .center
        textFieldCountLabel.font = UIFont.bodyText
        textFieldCountLabel.textColor = UIColor.black
        textFieldCountLabel.delegate = self
        textFieldCountLabel.contentVerticalAlignment = .center
        addSubview(textFieldNameLabel)
        addSubview(textFieldCountLabel)
        selectionStyle = .none
        selectedBackgroundView?.backgroundColor = UIColor.white
    }

    public func setItemText( name: String?, count: Int?) {
        guard let name = name, let count = count else {
            textFieldNameLabel.text = String.phi
            textFieldCountLabel.text = String.phi
            return
        }
        textFieldNameLabel.text = name
        textFieldCountLabel.text = String(count)
    }
}

extension BuyListItemCell: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        // TODO: 編集時にもsaveされてしまっているので要修正
        eventHandler.saveAddItem(textField.text)
    }
}
