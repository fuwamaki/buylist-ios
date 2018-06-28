//
//  SettingTableViewResource.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/09.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation

struct SettingTableViewResource {
    
    fileprivate var list:[SettingSectionInfo]?  {
        return [SettingNotificationSectionInfo(), SettingAppInfoSectionInfo()]
    }
    
    var count:Int {//SectionList数
        guard let sectionListCount = list?.count else {
            return 0
        }
        return sectionListCount
    }
    
    subscript(index:Int) -> SettingSectionInfo? {
        get {
            guard let sectionList = list else{
                return nil
            }
            if sectionList.count > index {
                return sectionList[index]
            } else {
                return nil
            }
        }
    }
    
    func getSectionInfo<T:SettingSectionInfo>() -> T {
        var info:SettingSectionInfo?
        list!.forEach {
            if let sameInfo = $0 as? T {
                info = sameInfo
                return
            }
        }
        return info as! T
    }
}
