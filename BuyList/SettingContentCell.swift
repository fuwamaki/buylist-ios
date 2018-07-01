//
//  SettingContentCell.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/09.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import UIKit

class SettingContentCell: UITableViewCell {

    static let identifier = SettingContentCell.className

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var appVersionLabel: UILabel!

    func setContentTitle(_ dto: SettingViewCellDto) {
        self.titleLabel.text = dto.title
    }

    func setAppVersion(_ appVersion: String) {
        self.appVersionLabel.text = appVersion
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        let view = UIView()
        view.backgroundColor = UIColor(white: 0xdbdbdb, alpha: 1)
        self.selectedBackgroundView = view
    }
}
