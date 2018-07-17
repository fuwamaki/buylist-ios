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

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        textFieldNameLabel = UITextField(frame: CGRect.null)
        eventHandler = BuyListPresenter(BuyListVC())
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        textFieldNameLabel = UITextField(frame: CGRect.null)
        eventHandler = BuyListPresenter(BuyListVC())
        super.init(coder: aDecoder)
        setupViews()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        textFieldNameLabel.frame = CGRect(x: CGFloat.leftMargin, y: 0, width: bounds.size.width - CGFloat.leftMargin, height: bounds.size.height)
    }

    // TODO: countのlabel追加
    private func setupViews() {
        textFieldNameLabel.font = UIFont.bodyText
        textFieldNameLabel.textColor = UIColor.black
        textFieldNameLabel.delegate = self
        textFieldNameLabel.contentVerticalAlignment = .center
        addSubview(textFieldNameLabel)
        selectedBackgroundView?.backgroundColor = UIColor.white
    }

    func setItemTitle(_ title: String?) {
        textFieldNameLabel.text = title ?? String.phi
    }
}

extension BuyListItemCell: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        eventHandler.saveAddItem(textField.text)
    }
}
