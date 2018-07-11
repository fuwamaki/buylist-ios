//
//  BuyHistoryTableCell.swift
//  BuyList
//
//  Created by y-maki on 2018/07/11.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import UIKit

final class BuyListHistoryTableCell: UITableViewCell {

    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var itemCreateTimeLabel: UILabel!
    @IBOutlet weak var itemCheckLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setLabel(_ item: ItemEntity) {
        itemNameLabel.text = item.itemName
        itemCountLabel.text = String(item.count)
//        itemCreateTimeLabel.text = String(item.createTime)
//        itemCheckLabel.text = String(item.boughtTime)
    }
}

extension BuyListHistoryTableCell: NibLoadable {}
