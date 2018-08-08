//
//  BuyHistoryTableCell.swift
//  BuyList
//
//  Created by y-maki on 2018/07/11.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import UIKit

final class BuyListHistoryCell: UITableViewCell {

    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var itemCreateTimeLabel: UILabel!
    @IBOutlet weak var itemCheckTimeLabel: UILabel!

    private struct Constant {
        static let createTimeLabelText = "作成時間:"
        static let checkTimeLabelText = "チェック時間:"
        static let spaceTimeLabelText = "----年--月--日"
    }

    // TODO: dateFormatterはextensionファイルにできればしたい
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy年M月d日"
        return dateFormatter
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setLabel(_ item: ItemEntity) {
        itemNameLabel.text = item.name
        itemCountLabel.text = String(item.count)
        itemCreateTimeLabel.text = Constant.createTimeLabelText + dateFormatter.string(from: item.createTime)
        if let checkTime = item.checkTime {
            itemCheckTimeLabel.text = Constant.checkTimeLabelText + dateFormatter.string(from: checkTime)
        } else {
            itemCheckTimeLabel.text = Constant.checkTimeLabelText + Constant.spaceTimeLabelText
        }
    }
}

extension BuyListHistoryCell: NibLoadable {}
