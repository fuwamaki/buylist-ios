//
//  BuyListContentCell.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/11.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import UIKit

class BuyListContentCell: UITableViewCell {

    private var textFieldLabel: UITextField

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        textFieldLabel = UITextField(frame: CGRect.null)
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        textFieldLabel = UITextField(frame: CGRect.null)
        super.init(coder: aDecoder)
        setupViews()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        textFieldLabel.frame = CGRect(x: 16.0, y: 0, width: bounds.size.width - 16.0, height: bounds.size.height)
    }
    private func setupViews() {
        textFieldLabel.font = UIFont.bodyText
        textFieldLabel.textColor = UIColor.black
        textFieldLabel.delegate = self
        textFieldLabel.contentVerticalAlignment = .center
        addSubview(textFieldLabel)
        selectedBackgroundView?.backgroundColor = UIColor.white
    }

    func setContentTitle(_ title: String?) {
        textFieldLabel.text = title ?? ""
    }
}

extension BuyListContentCell: UITextFieldDelegate {

}
