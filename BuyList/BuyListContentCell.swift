//
//  BuyListContentCell.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/11.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import UIKit

class BuyListContentCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        selectedBackgroundView?.backgroundColor = UIColor.white
        textLabel?.font = UIFont.bodyText
        textLabel?.textColor = UIColor.black
    }
    
    func setContentTitle(_ dto: BuyListContentDto) {
        textLabel?.text = dto.title
    }
}