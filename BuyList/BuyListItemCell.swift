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
    private var textFieldLabel: UITextField

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        textFieldLabel = UITextField(frame: CGRect.null)
        eventHandler = BuyListPresenter(BuyListVC())
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        textFieldLabel = UITextField(frame: CGRect.null)
        eventHandler = BuyListPresenter(BuyListVC())
        super.init(coder: aDecoder)
        setupViews()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        textFieldLabel.frame = CGRect(x: CGFloat.leftMargin, y: 0, width: bounds.size.width - CGFloat.leftMargin, height: bounds.size.height)
    }

    private func setupViews() {
        textFieldLabel.font = UIFont.bodyText
        textFieldLabel.textColor = UIColor.black
        textFieldLabel.delegate = self
        textFieldLabel.contentVerticalAlignment = .center
        addSubview(textFieldLabel)
        selectedBackgroundView?.backgroundColor = UIColor.white
    }

    func setItemTitle(_ title: String?) {
        textFieldLabel.text = title ?? String.phi
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
